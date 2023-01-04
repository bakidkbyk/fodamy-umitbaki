//
//  ToastPresenter.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.01.2023.
//

import SwiftUI
import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .gray, dark: .gray))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        
        let customView = ToastWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
