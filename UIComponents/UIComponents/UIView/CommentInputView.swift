//
//  CommentInputView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 12.06.2023.
//

import UIKit

public class CommentInputView: UIView {
    
    private let textView = UITextViewBuilder()
        .cornerRadius(20)
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.black)
        .borderColor(UIColor.appZircon.cgColor)
        .isScrollEnabled(false)
        .textContainerInset(UIEdgeInsets(top: 11, left: 15, bottom: 11, right: 15))
        .borderWidth(1)
        .build()
    
    private let placeHolderLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appRaven)
        .text(L10n.CommentList.placeHolder)
        .build()
    
    private let sendButton = UIButtonBuilder()
        .cornerRadius(20)
        .backgroundColor(.appRed)
        .clipsToBounds(true)
        .image(UIImage.icSend.withRenderingMode(.alwaysTemplate))
        .tintColor(.appWhite)
        .build()
    
    public var sendButtonTapped: StringClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
    }
    
    public var textViewText: String? {
        willSet {
            textView.text = newValue
        }
    }
}

// MARK: - UILayout
extension CommentInputView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        
        addSubview(textView)
        textView.topToSuperview().constant = 10
        textView.edgesToSuperview(excluding: [.right, .top], insets: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 0))
        
        textView.addSubview(placeHolderLabel)
        placeHolderLabel.edgesToSuperview(excluding: [.leading, .top])
        placeHolderLabel.topToSuperview().constant = 12
        placeHolderLabel.leadingToSuperview().constant = 18
        
        addSubview(sendButton)
        sendButton.trailingToSuperview(offset: 15)
        sendButton.centerYToSuperview()
        sendButton.leftToRight(of: textView, offset: 15)
        sendButton.size(.init(width: 40, height: 40))
    }
}

// MARK: - Configure Contents
extension CommentInputView {
    
    private func configureContents() {
        textView.delegate = self
        sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
    }
}

// MARK: - Actions
extension CommentInputView {
    
    @objc
    func sendButtonAction() {
        textViewText = textView.text
        sendButtonTapped?(textViewText ?? "")
    }
}

// MARK: - UITextView Delegate
extension CommentInputView: UITextViewDelegate {
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            sendButton.backgroundColor = .gray
            placeHolderLabel.isHidden = false
        } else {
            sendButton.backgroundColor = .red
            placeHolderLabel.isHidden = true
        }
    }
}
