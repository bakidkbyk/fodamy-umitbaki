//
//  ReusableView+Extensions.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.02.2023.
//

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
