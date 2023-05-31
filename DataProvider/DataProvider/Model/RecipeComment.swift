//
//  RecipeComment.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 31.05.2023.
//

public struct RecipeComment: Decodable {
    public let id: String?
    public let text: String?
    public let difference: String?
    public let user: User?
}
