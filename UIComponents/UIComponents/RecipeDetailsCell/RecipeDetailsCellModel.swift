//
//  RecipeDetailsCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.04.2023.
//

import Foundation

public protocol RecipeDetailsCellDataSource: AnyObject {
    
}

public protocol RecipeDetailsCellEventSource: AnyObject {
    
}

public protocol RecipeDetailsCellProtocol: RecipeDetailsCellDataSource, RecipeDetailsCellEventSource {
    
}

public final class RecipeDetailsCellModel: RecipeDetailsCellProtocol {
    
}
