//
//  commentEditAlertView.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 10.07.2023.
//

import UIKit

protocol CommentEditAlertViewRoute {
    func commentEditAlertView(edit: VoidClosure?)
}

extension CommentEditAlertViewRoute where Self: RouterProtocol {

    func commentEditAlertView(edit: VoidClosure?) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let edit = UIAlertAction(title: L10n.CommentList.edit, style: .destructive) { _ in
            edit?()
        }

        let cancel = UIAlertAction(title: L10n.CommentList.cancel, style: .cancel)
        
        let transition = ModalTransition()

        alertController.addAction(edit)
        alertController.addAction(cancel)

        open(alertController, transition: transition)
    }
}
