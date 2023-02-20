//
//  Pagination.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

public struct Pagination: Decodable {
    
    public let currentPage: Int
    public let lastPage: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
    }
}
