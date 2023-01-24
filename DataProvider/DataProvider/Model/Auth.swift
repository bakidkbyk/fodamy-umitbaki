//
//  Auth.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 24.01.2023.
//

public struct Auth: Decodable {
    public let token: String
    public let user: User
}
