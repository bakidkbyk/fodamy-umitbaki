//
//  Denemee.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 3.01.2023.
//

import UIKit

public class Denemee: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        backgroundColor = .red
    }
    
}
