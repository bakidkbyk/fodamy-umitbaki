//
//  ViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 2.01.2023.
//

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let usernameTextField = FloatLabelTextField()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(usernameTextField)
        usernameTextField.edgesToSuperview(excluding: .bottom, insets: .init(top: 24, left: 40, bottom: 0, right: 40), usingSafeArea: true)
        usernameTextField.height(60)
        usernameTextField.title = L10n.username
        usernameTextField.leftImage = .icUser
    }
}
