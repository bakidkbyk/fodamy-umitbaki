//
//  FavoritesCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.03.2023.
//

public protocol FavoritesCellDataSource: AnyObject {
    
    var categoryId: Int { get }
    var categoryImage: String? { get }
    var categoryName: String? { get }
    var cellItems: [FavoritesCollectionCellProtocol] { get }
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
    public var cellItems: [FavoritesCollectionCellProtocol]
    
    public init(categoryId: Int, categoryImage: String?, categoryName: String?, cellItems: [FavoritesCollectionCellProtocol]) {
        self.categoryId = categoryId
        self.categoryImage = categoryImage
        self.categoryName = categoryName
        self.cellItems = cellItems
    }
}
