//
//  CommentEditViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 8.07.2023.
//

import Foundation

protocol CommentEditViewDataSource {}

protocol CommentEditViewEventSource {}

protocol CommentEditViewProtocol: CommentEditViewDataSource, CommentEditViewEventSource {}

final class CommentEditViewModel: BaseViewModel<CommentEditRouter>, CommentEditViewProtocol {
    
}
