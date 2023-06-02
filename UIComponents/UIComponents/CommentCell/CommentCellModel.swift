//
//  CommentCellCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 1.06.2023.
//

import Foundation

public protocol CommentCellCellDataSource: AnyObject {
    
}

public protocol CommentCellCellEventSource: AnyObject {
    
}

public protocol CommentCellCellProtocol: CommentCellCellDataSource, CommentCellCellEventSource {
    
}

public final class CommentCellCellModel: CommentCellCellProtocol {
    
}
