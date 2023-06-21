//
//  CommentListViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 9.06.2023.
//

import Foundation

protocol CommentListViewDataSource {}

protocol CommentListViewEventSource {}

protocol CommentListViewProtocol: CommentListViewDataSource, CommentListViewEventSource {}

final class CommentListViewModel: BaseViewModel<CommentListRouter>, CommentListViewProtocol {
    
}
