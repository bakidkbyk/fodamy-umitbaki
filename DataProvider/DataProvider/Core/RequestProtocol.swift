//
//  RequestProtocol.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 10.01.2023.
//

public protocol RequestProtocol {
    var parth: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
