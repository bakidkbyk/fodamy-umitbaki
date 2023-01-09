//
//  MainCategory.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 9.01.2023.
//

public struct MainCategory: Decodable {
    
    public let id: Int
    public let name: String?
    public let recipes: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case recipes
        
    }
}
