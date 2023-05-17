//
//  RecipeDetailsViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

import Foundation

protocol RecipeDetailsViewDataSource {}

protocol RecipeDetailsViewEventSource {}

protocol RecipeDetailsViewProtocol: RecipeDetailsViewDataSource, RecipeDetailsViewEventSource {}

final class RecipeDetailsViewModel: BaseViewModel<RecipeDetailsRouter>, RecipeDetailsViewProtocol {
    
}
