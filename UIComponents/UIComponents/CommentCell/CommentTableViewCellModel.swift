//
//  CommentTableViewCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.06.2023.
//

import Foundation

public protocol CommentTableViewCellDataSource: AnyObject {
    var userId: Int { get }
    var usernameImageUrl: String? { get }
    var username: String? { get }
    var recipeAndFollowers: String? { get }
    var commentId: Int { get }
    var commentText: String? { get }
    var timeDifferenceText: String? { get }
}

public protocol CommentTableViewCellEventSource: AnyObject {
    
}

public protocol CommentTableViewCellProtocol: CommentTableViewCellDataSource, CommentTableViewCellEventSource {
    
}

public final class CommentTableViewCellModel: CommentTableViewCellProtocol {
    
    public var userId: Int
    public var usernameImageUrl: String?
    public var username: String?
    public var recipeAndFollowers: String?
    public var commentId: Int
    public var commentText: String?
    public var timeDifferenceText: String?
    
    public init(userId: Int,
                usernameImageUrl: String?,
                username: String?,
                recipeAndFollowers: String?,
                commentId: Int,
                commentText: String?,
                timeDifferenceText: String?) {
        self.userId = userId
        self.usernameImageUrl = usernameImageUrl
        self.username = username
        self.recipeAndFollowers = recipeAndFollowers
        self.commentId = commentId
        self.commentText = commentText
        self.timeDifferenceText = timeDifferenceText
    }
}
