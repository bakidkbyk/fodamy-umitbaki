//
//  CategoryRecipes.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 7.03.2023.
//

public struct CategoryRecipes: Decodable {
    
    public let id: Int
    public let name: String?
    public let recipes: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case recipes
    }
}
