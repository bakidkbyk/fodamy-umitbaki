//
//  FavoritesCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.03.2023.
//

import Utilities

public protocol FavoritesCellDataSource: AnyObject {
    
    var categoryId: Int { get }
    var categoryImage: String? { get }
    var categoryName: String? { get }
}

public protocol FavoritesCellEventSource: AnyObject {
    var seeAllButtonClosure: IntClosure? { get set }
}

public protocol FavoritesCellProtocol: FavoritesCellDataSource, FavoritesCellEventSource { }

public class FavoritesCellModel: FavoritesCellProtocol {
    
    public var seeAllButtonClosure: IntClosure?
    
    public var categoryId: Int
    public var categoryImage: String?
    public var categoryName: String?
    
    public init(categoryId: Int, categoryImage: String?, categoryName: String?) {
        self.categoryId = categoryId
        self.categoryImage = categoryImage
        self.categoryName = categoryName
    }
}
