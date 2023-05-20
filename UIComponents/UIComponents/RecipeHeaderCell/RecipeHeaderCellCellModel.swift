//
//  RecipeHeaderCellCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 20.05.2023.
//

import Foundation

public protocol RecipeHeaderCellCellDataSource: AnyObject {
    var imgUrl: String? { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeHeaderCellCellEventSource: AnyObject {
    
}

public protocol RecipeHeaderCellCellProtocol: RecipeHeaderCellCellDataSource, RecipeHeaderCellCellEventSource {
    
}

public final class RecipeHeaderCellCellModel: RecipeHeaderCellCellProtocol {
    
    public var imgUrl: String?
    public var isEditorChoice: Bool
    
    public init(imgUrl: String?, isEditorChoice: Bool) {
        self.imgUrl = imgUrl
        self.isEditorChoice = isEditorChoice
    }
}
