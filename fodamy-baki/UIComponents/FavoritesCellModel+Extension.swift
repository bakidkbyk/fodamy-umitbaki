//
//  FavoritesCellModel+Extension.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 7.03.2023.
//

extension FavoritesCellModel {
    
    convenience init(categoryRecipes: CategoryRecipes) {
        self.init(categoryId: categoryRecipes.id,
                  categoryImage: nil,
                  categoryName: categoryRecipes.name)
    }
}
