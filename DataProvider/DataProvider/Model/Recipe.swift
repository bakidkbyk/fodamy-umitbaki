//
//  Recipe.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

public struct Recipe: Decodable {
    
    public let id: Int
    public let title: String
    public let likeCount: Int
    public let commentCount: Int
    public let user: User
    public let image: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case user
        case image
    }
}
