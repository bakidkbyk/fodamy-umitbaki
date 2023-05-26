//
//  RecipeDetails.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 13.04.2023.
//

public struct RecipeDetails: Decodable {
    
    public let id: Int
    public let title: String?
    public let ingredients: String?
    public let directions: String?
    public let difference: String?
    public let likeCount: String?
    public let commentCount: String?
    public let isEditorChoice: Bool?
    public let timeOfRecipe: TimeOfRecipe
    public let numberOfPerson: NumberOfPerson
    public let category: Categories
    public let user: User
    public let images: Image
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case ingredients
        case directions
        case difference
        case likeCount = "like_count"
        case commentCount = "commment_count"
        case isEditorChoice = "is_editor_choice"
        case timeOfRecipe = "time_of_recipe"
        case numberOfPerson = "number_of_person"
        case category
        case user
        case images
    }
}
