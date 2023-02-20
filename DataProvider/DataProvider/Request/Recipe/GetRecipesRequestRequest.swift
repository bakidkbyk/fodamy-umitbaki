//
//  GetRecipesRequestRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 20.02.2023.
//

public struct GetRecipesRequestRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[Recipe]>
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    public var listingType: ListingType
    
    public init(page: Int, listingType: ListingType) {
        self.parameters["page"] = page
        self.listingType = listingType
        switch listingType {
        case .lastAdded:
            path = "editor-choices"
        case .editorChoices:
            path = "recipe/"
        }
    }
    
}

public enum ListingType {
    case lastAdded
    case editorChoices
}
