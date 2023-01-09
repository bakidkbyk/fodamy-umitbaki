//
//  CategoryDetail.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 9.01.2023.
//

public struct CategoryDetail: Decodable {
    
    public let id: Int
    public let name: String?
    public let mainCategoryId: Int?
    public let imageUrl: Image?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case mainCategoryId = "main_category_id"
        case imageUrl = "image"
    }
}
