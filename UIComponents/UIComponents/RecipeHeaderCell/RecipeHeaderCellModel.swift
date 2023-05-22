//
//  RecipeHeaderCellCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 20.05.2023.
//

import Foundation

public protocol RecipeHeaderCellDataSource: AnyObject {
    var imgUrl: String? { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeHeaderCellCellEventSource: AnyObject {
    
}

public protocol RecipeHeaderCellProtocol: RecipeHeaderCellDataSource, RecipeHeaderCellCellEventSource {
    
}

public final class RecipeHeaderCellModel: RecipeHeaderCellProtocol {
    
    public var imgUrl: String?
    public var isEditorChoice: Bool
    
    public init(imgUrl: String?, isEditorChoice: Bool) {
        self.imgUrl = imgUrl
        self.isEditorChoice = isEditorChoice
    }
}
