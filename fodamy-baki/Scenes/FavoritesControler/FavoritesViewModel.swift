//
//  FavoritesViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 7.02.2023.
//

import Foundation

protocol FavoritesViewDataSource {}

protocol FavoritesViewEventSource {}

protocol FavoritesViewProtocol: FavoritesViewDataSource, FavoritesViewEventSource {}

final class FavoritesViewModel: BaseViewModel<FavoritesRouter>, FavoritesViewProtocol {
    
}
