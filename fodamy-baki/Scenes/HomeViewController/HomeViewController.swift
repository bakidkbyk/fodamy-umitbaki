//
//  ViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 2.01.2023.
//

class HomeViewController: BaseViewController<HomeViewModel> {

    private let actionButton = UIButtonBuilder()
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(actionButton)
        actionButton.setTitle("goAnotherController", for: .normal)
        actionButton.centerInSuperview()
        actionButton.size(.init(width: 200, height: 200))
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
  }
}

extension HomeViewController {
    
    @objc
    func actionButtonTapped() {
        viewModel.showInitialViewOnWindow()
    }
    
}
