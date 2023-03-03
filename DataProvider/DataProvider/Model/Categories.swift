//
//  CategoryDetails.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

public struct Categories: Decodable {
    
    public let id: Int
    public let name: String?
    public let mainCategoryId: Int?
    public let image: Image?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case mainCategoryId = "main_category_id"
        case image
    }
    
}
