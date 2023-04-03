//
//  MainNavigationController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    func configureContents() {
        let textAttributes = AttributedStringDictionaryBuilder()
            .font(.font(.nunitoExtraBold, size: .medium))
            .foregroundColor(.appWhite)
            .build()
        
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .appWhite
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.shadowColor = .clear
            appearance.backgroundColor = .appRed
            appearance.titleTextAttributes = textAttributes
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        } else {
            navigationBar.barTintColor = .appRed
            navigationBar.titleTextAttributes = textAttributes
            navigationBar.shadowImage = nil
            navigationBar.backgroundColor = .appRed
        }
    }
}
