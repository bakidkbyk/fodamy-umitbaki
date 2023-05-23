//
//  RecipeDetailsCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.05.2023.
//

import Foundation

public protocol RecipeDetailsCellDataSource: AnyObject {
    var imgUrl: String? { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeDetailsCellEventSource: AnyObject {
    
}

public protocol RecipeDetailsCellProtocol: RecipeDetailsCellDataSource, RecipeDetailsCellEventSource {
    
}

public final class RecipeDetailsCellModel: RecipeDetailsCellProtocol {
    
    public var imgUrl: String?
    public var isEditorChoice: Bool
    
    public init(imgUrl: String?, isEditorChoice: Bool) {
        self.imgUrl = imgUrl
        self.isEditorChoice = isEditorChoice
    }
}
