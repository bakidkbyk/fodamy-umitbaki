//
//  RecipeDetailsCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.05.2023.
//


public protocol RecipeHeaderCellDataSource: AnyObject {
    var imageUrl: String { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeHeaderCellEventSource: AnyObject {}

public protocol RecipeHeaderCellProtocol: RecipeHeaderCellDataSource, RecipeHeaderCellEventSource {}

public final class RecipeHeaderCellModel: RecipeHeaderCellProtocol {
    
    public var imageUrl: String
    public var isEditorChoice: Bool
    
    public init(imageUrl: String, isEditorChoice: Bool) {
        self.imageUrl = imageUrl
        self.isEditorChoice = isEditorChoice
    }
}
