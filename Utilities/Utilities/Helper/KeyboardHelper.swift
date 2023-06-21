//
//  KeyboardHelper.swift
//  Utilities
//
//  Created by Baki Dikbıyık on 19.06.2023.
//

import UIKit

public protocol KeyboardHelperDelegate: AnyObject {
    func keyboardWillShow(_ keyboardHeight: CGFloat)
    
    func keyboardWillHide()
}

public class KeyboardHelper {
    
    public weak var delegate: KeyboardHelperDelegate?
    
    init() {
        setObservers()
    }
    
    @objc
    private func keyboardWillShow(_ notification: Notification?) {
        guard let userInfo = notification?.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        delegate?.keyboardWillShow(keyboardHeight)
                
    }
    
    @objc
    private func keyboardWillHide() {
        delegate?.keyboardWillHide()
    }

    private func setObservers() {
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
