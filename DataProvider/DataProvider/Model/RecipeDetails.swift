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
    public let instructions: String?
    public let isLiked: Bool
    public let timeDifference: String?
    public let isEditorChoice: Bool
    public let likeCount: Int
    public let commentCount: Int
    public let user: User
    public let timeOfRecipe: TimeOfRecipe
    public let numberOfPerson: NumberOfPerson
    public let category: Categories 
    public let images: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case ingredients
        case instructions = "directions"
        case isLiked = "is_liked"
        case timeDifference = "difference"
        case isEditorChoice = "is_editor_choice"
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case user
        case timeOfRecipe = "time_of_recipe"
        case numberOfPerson = "number_of_person"
        case category
        case images
    }
}
