//
//  ViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 2.01.2023.
//

class HomeViewController: BaseViewController<HomeViewModel> {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configure()
        setLocalize()
    }
}

// MARK: UILayout
extension HomeViewController {
    
    private func addSubviews() {
    }
}

// MARK: - Configure Contents and Localize
extension HomeViewController {
    
    private func configure() {
        view.backgroundColor = .appWhite
    }
    
    private func setLocalize() {
        
    }
}

