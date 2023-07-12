//
//  CommentEditViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 8.07.2023.
//

import UIKit
import UIComponents

final class CommentEditViewController: BaseViewController<CommentEditViewModel> {
    
    private let textView = UITextViewBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    private let saveButtonView = UIView()
    
    private let saveButton = ButtonFactory.createPrimaryButton(style: .medium)
    
    private var bottomViewBottomConstraint: NSLayoutConstraint?
    private let keyboardHelper = KeyboardHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        localize()
    }
}

// MARK: - UILayout
extension CommentEditViewController {
    
    private func addSubViews() {
        addTextView()
        addSaveButtonView()
    }
    
    private func addTextView() {
        view.addSubview(textView)
        textView.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 26, left: 15, bottom: 0, right: 15), usingSafeArea: true)
        textView.height(150)
    }
    
    private func addSaveButtonView() {
        view.addSubview(saveButtonView)
        saveButtonView.widthToSuperview()
        bottomViewBottomConstraint = saveButtonView.bottomToSuperview(usingSafeArea: true)
        
        saveButtonView.addSubview(saveButton)
        saveButton.topToSuperview()
        saveButton.centerXToSuperview()
        saveButtonView.height(80)
    }
}

// MARK: - Configure Contents
extension CommentEditViewController {
    
    private func configureContents() {
        navigationItem.title = viewModel.title
        keyboardHelper.delegate = self
        view.backgroundColor = .appWhite
        
        textView.text = viewModel.commentText
        
        bottomViewBottomConstraint?.isActive = true
        
        saveButton.size(.init(width: 162.5, height: 50))
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func localize() {
        saveButton.setTitle(L10n.CommentEdit.saveButton, for: .normal)
    }
}

// MARK: - Actions
extension CommentEditViewController {
    
    @objc
    private func saveButtonTapped() {
        guard let commentText = textView.text, !commentText.isEmpty else {
            showWarningToast(message: L10n.CommentEdit.error)
            return
        }
        viewModel.commentEdit(commentText: commentText)
    }
}

// MARK: - KeyboardHelper
extension CommentEditViewController: KeyboardHelperDelegate {
    
    func keyboardWillShow(_ keyboardHeight: CGFloat) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.bottomViewBottomConstraint?.constant = self.view.safeAreaInsets.bottom - keyboardHeight
            self.view.layoutIfNeeded()
        }
    }
    
    func keyboardWillHide() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.bottomViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
