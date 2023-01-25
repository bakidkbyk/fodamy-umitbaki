//
//  TostWarningView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.01.2023.
//

import UIKit

public class ToastWarningView: UIView {
    
    private let label = UILabelBuilder()
        .font(.systemFont(ofSize: 16))
        .textColor(.appWhite)
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    
    init(text: String) {
        label.text = text
        label.sizeToFit()
        super.init(frame: .zero)
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        addSubview(label)
        label.edgesToSuperview(insets: .init(top: 14, left: 14, bottom: 14, right: 14))
    }
}
