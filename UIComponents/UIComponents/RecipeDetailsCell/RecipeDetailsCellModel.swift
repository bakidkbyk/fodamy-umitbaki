//
//  RecipeDetailsCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.05.2023.
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
