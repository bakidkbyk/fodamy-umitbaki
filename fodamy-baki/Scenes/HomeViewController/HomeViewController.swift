//
//  ViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 2.01.2023.
//

import Segmentio
import KeychainSwift

class HomeViewController: BaseViewController<HomeViewModel> {

    private let segmentControl: Segmentio = {
        let segmentControl = Segmentio()
        segmentControl.setup(content: [SegmentioItem(title: L10n.Home.editorChoices,
                                                     image: nil),
                                       SegmentioItem(title: L10n.Home.lassAdded,
                                                     image: nil)],
                                                     style: .onlyLabel,
                                                     options: .segmentioOptionsChanged())
        return segmentControl
    }()
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var subViewControllers: [UIViewController] = {
        return self.configureControllers()
    }()
    
    private let keychain = KeychainSwift()
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        segmentioControlDidChange()
        configure()
        addNavigationFodamyLogo()
        checkUserLogin()
        subscribeViewModelEvents()
    }
}

// MARK: UILayout
extension HomeViewController {
    
    private func addSubviews() {
        addSegmentView()
        addPageViewController()
    }
    
    private func addSegmentView() {
        view.addSubview(segmentControl)
        segmentControl.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
    
    private func addPageViewController() {
        definesPresentationContext = true
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        
        pageViewController.view.edgesToSuperview(excluding: .top, usingSafeArea: true)
        pageViewController.view.topToBottom(of: segmentControl)
    }
}

// MARK: - Configure Contents
extension HomeViewController {
    
    private func configure() {
        view.backgroundColor = .appWhite
        pageViewController.delegate = self
        pageViewController.dataSource = self
        segmentControl.height(46)
        
        pageViewController.setViewControllers([subViewControllers[viewModel.selectedSegmentIndex]], direction: .forward, animated: true)
        segmentControl.selectedSegmentioIndex = 0
    }
    
    private func addNavigationFodamyLogo() {
        let image = UIImage.imgLogoFodamy
        let imageView = UIImageView()
        imageView.size(CGSize(width: 110, height: 30))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        navigationItem.titleView = imageView
    }
}

// MARK: - Configure Controllers
extension HomeViewController {
    
    private func configureControllers() -> [UIViewController] {
        let editorChoiceRouter = RecipesRouter()
        let editorChoiceViewModel = RecipesViewModel(recipesListing: .editorChoices, router: editorChoiceRouter)
        let editorChoiceViewController = RecipesViewController(viewModel: editorChoiceViewModel)
        editorChoiceRouter.viewController = editorChoiceViewController
        
        let lastAddedRouter = RecipesRouter()
        let lastAddedViewModel = RecipesViewModel(recipesListing: .lastAdded, router: lastAddedRouter)
        let lastAddedViewController = RecipesViewController(viewModel: lastAddedViewModel)
        lastAddedRouter.viewController = lastAddedViewController
        
        return [editorChoiceViewController, lastAddedViewController]
    }
}

// MARK: - Segmented Control Value Change
extension HomeViewController {

    private func segmentioControlDidChange() {
        segmentControl.valueDidChange = { [ weak self ]  _, segmentIndex in
            guard let self = self else { return }
            var direction: UIPageViewController.NavigationDirection = .forward
             if segmentIndex < self.viewModel.selectedSegmentIndex {
                 direction = .reverse
             }
            self.pageViewController.setViewControllers([self.subViewControllers[segmentIndex]], direction: direction, animated: true)
            self.viewModel.selectedSegmentIndex = segmentIndex
        }
    }
 }

// MARK: - Page View Controller Delegate
extension HomeViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = subViewControllers.firstIndex(of: currentViewController) {
                segmentControl.selectedSegmentioIndex = index
            }
        }
    }
}

// MARK: - Page View Controller Data Source
extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.subViewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        let before = index - 1
        return subViewControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.subViewControllers.firstIndex(of: viewController), index < (subViewControllers.count - 1) else { return nil }
        let after = index + 1
        return subViewControllers[after]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
}

// MARK: - Logout
extension HomeViewController {
    
    private func setLogoutBarButton() {
        let button = UIBarButtonItem(image: .icLogout, style: .done, target: self, action: #selector(logoutBarButtonTapped))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    func logoutBarButtonTapped() {
        viewModel.userLogout()
    }
    
    private func checkUserLogin() {
        guard keychain.get(Keychain.token) != nil else {
            navigationItem.rightBarButtonItem = .none
            return
        }
        setLogoutBarButton()
    }
    // Delete keychain
    private func subscribeViewModelEvents() {
        viewModel.didSuccessLogut = { [ weak self ] in
            guard let self = self else { return }
            self.keychain.delete(Keychain.token)
            self.navigationItem.rightBarButtonItem = .none
        }
    }
}
