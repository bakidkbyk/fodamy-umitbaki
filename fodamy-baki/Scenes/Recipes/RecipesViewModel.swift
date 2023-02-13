//
//  RecipesViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 13.02.2023.
//

import Foundation

protocol RecipesViewDataSource {}

protocol RecipesViewEventSource {}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    
}
