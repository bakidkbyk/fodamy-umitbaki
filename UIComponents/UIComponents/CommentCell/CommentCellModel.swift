//
//  CommentCellCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 1.06.2023.
//

import Foundation
import Utilities

public protocol CommentCellDataSource: AnyObject {
    var userId: Int { get }
    var usernameImageUrl: String? { get }
    var username: String? { get }
    var recipeAndFollowers: String? { get }
    var commentId: Int { get }
    var commentText: String? { get set }
    var timeDifferenceText: String? { get }
    var isOwner: Bool { get set }
    
}

public protocol CommentCellEventSource: AnyObject {
    var moreButtonTapped: VoidClosure? { get set }
}

public protocol CommentCellProtocol: CommentCellDataSource, CommentCellEventSource {
    
}

public final class CommentCellModel: CommentCellProtocol {
    
    public var userId: Int
    public var usernameImageUrl: String?
    public var username: String?
    public var recipeAndFollowers: String?
    public var commentId: Int
    public var commentText: String?
    public var timeDifferenceText: String?
    public var isOwner: Bool
    public var moreButtonTapped: VoidClosure?

    public init(userId: Int,
                usernameImageUrl: String?,
                username: String?,
                recipeAndFollowers: String?,
                commentId: Int,
                commentText: String?,
                timeDifferenceText: String?, isOwner: Bool) {
        self.userId = userId
        self.usernameImageUrl = usernameImageUrl
        self.username = username
        self.recipeAndFollowers = recipeAndFollowers
        self.commentId = commentId
        self.commentText = commentText
        self.timeDifferenceText = timeDifferenceText
        self.isOwner = isOwner
    }
}
