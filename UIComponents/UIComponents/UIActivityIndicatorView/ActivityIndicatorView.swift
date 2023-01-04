//
//  UIActivityIndicatorView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.01.2023.
//

import UIKit

public class ActivityIndicatorView: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        style = .gray
        tintColor = .gray
        hidesWhenStopped = true
    }
    
}
