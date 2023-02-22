//
//  Recipe.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

public struct Recipe: Decodable {
    
    public let id: Int
    public let title: String?
    public let likeCount: Int
    public let commentCount: Int
    public let isEditorChoice: Bool
    public let category: Categories
    public let user: User
    public let image: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case likeCount = "likes_count"
        case commentCount = "comment_count"
        case isEditorChoice = "is_editor_choice"
        case category 
        case user
        case image
    }
}
