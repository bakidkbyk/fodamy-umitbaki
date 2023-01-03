//
//  ViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 2.01.2023.
//

class ViewController: UIViewController {
    
    private let denemee = Denemee()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(denemee)
        denemee.centerInSuperview()
        denemee.size(.init(width: 200, height: 200))
  }
}
