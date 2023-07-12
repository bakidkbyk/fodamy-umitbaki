//
//  CommentListRouter.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 9.06.2023.
//

final class CommentListRouter: Router, CommentListRouter.Routes {
    typealias Routes = LoginRoute & LoginWarningUpRoute & CommentEditRoute & CommentActionsAlertRoute
}
