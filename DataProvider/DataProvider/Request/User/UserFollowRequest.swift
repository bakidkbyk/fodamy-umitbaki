//
//  UserFollowRequestRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 1.07.2023.
//

public struct UserFollowRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "user/{followedId}/following"
    public var method: RequestMethod = .post
    
    public init(followedId: Int, followType: FollowType) {
        self.path = "user/\(followedId)/following"
        switch followType {
        case .follow:
            self.method = .post
        case .unfollow:
            self.method = .delete
        }
    }
    
    public enum FollowType {
        case follow
        case unfollow
    }
}
