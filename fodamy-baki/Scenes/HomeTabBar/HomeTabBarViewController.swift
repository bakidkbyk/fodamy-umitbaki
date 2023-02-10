//
//  HomeTabBarViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 6.02.2023.
//


class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .appRed

        let homeViewController = createHomeViewController()
        let favoritesViewController = createFavoritesController()

        self.setViewControllers([homeViewController, favoritesViewController], animated: false)
    }
    
    private func createHomeViewController() -> UINavigationController {
        let homeRouter = HomeViewRouter()
        let homeViewModel = HomeViewModel(router: homeRouter)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.tabBarItem.image = .icHome
        homeRouter.viewController = homeViewController
        return navigationController
    }
    
    private func createFavoritesController() -> UINavigationController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel(router: favoritesRouter)
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        let navigationController = UINavigationController(rootViewController: favoritesViewController)
        navigationController.tabBarItem.image = .icHeart
        favoritesRouter.viewController = favoritesViewController
        return navigationController
    }
}
