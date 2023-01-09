//
//  RecipeComment.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 9.01.2023.
//

public struct RecipeComment: Decodable {
    
    public let id: Int
    public let text: String?
    public let timeDifference: String?
    public let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case timeDifference = "difference"
        case user
    }
}
