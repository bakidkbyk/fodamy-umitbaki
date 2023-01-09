//
//  Recipe.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 9.01.2023.
//

public struct Recipe: Decodable {
    
    public let id: Int
    public let title: String?
    public let isEditorChoice: Bool
    public let likeCount: Int
    public let commentCount: Int
    public let user: User
    public let category: CategoryDetail
    public let images: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isEditorChoice = "is_editor_choice"
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case user
        case category
        case images
    }
}
