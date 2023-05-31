//
//  RecipeDetailsViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

protocol RecipeDetailsViewDataSource {
    var username: String? { get }
    var userId: Int? { get }
    var recipeHeaderImageUrl: String? { get }
    var userImageUrl: String? { get }
    var userFollowedCount: Int? { get }
    var recipeName: String? { get }
    var recipeCount: Int? { get }
    var categoryName: String? { get }
    var timeDifferenceText: String? { get }
    var recipeAndFollowerCountText: String? { get }
    var commentCount: Int? { get }
    var likeCount: Int? { get }
    var ingredients: String? { get }
    var numberOfPeople: String? { get }
    var recipeSteps: String? { get }
    var time: String? { get }
}

protocol RecipeDetailsViewEventSource {
    var reloadDetailData: VoidClosure? { get set }
}

protocol RecipeDetailsViewProtocol: RecipeDetailsViewDataSource, RecipeDetailsViewEventSource {}

final class RecipeDetailsViewModel: BaseViewModel<RecipeDetailsRouter>, RecipeDetailsViewProtocol {
    
    var username: String?
    var userId: Int?
    var recipeHeaderImageUrl: String?
    var userImageUrl: String?
    var userFollowedCount: Int?
    var recipeName: String?
    var recipeCount: Int?
    var categoryName: String?
    var timeDifferenceText: String?
    var recipeAndFollowerCountText: String?
    var commentCount: Int?
    var likeCount: Int?
    var ingredients: String?
    var numberOfPeople: String?
    var recipeSteps: String?
    var time: String?
    
    var imagesCellItems: [RecipeHeaderCellProtocol] = []
    private let recipeId: Int
    var reloadDetailData: VoidClosure?
    var isFollowing = true
    
    init(recipeId: Int, router: RecipeDetailsRouter) {
        self.recipeId = recipeId
        super.init(router: router)
    }
}

// MARK: - Network
// swiftlint:disable line_length
extension RecipeDetailsViewModel {
    
    func getRecipesDetail() {
        showLoading?()
        dataProvider.request(for: GetRecipeDetailsRequest(recipeId: recipeId)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let recipeDetails):
                self.setData(recipeDetail: recipeDetails)
                self.reloadDetailData?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func setData(recipeDetail: RecipeDetails) {
        username = recipeDetail.user.username
        userId = recipeDetail.user.id
        recipeDetail.images.forEach { image in
            imagesCellItems.append(RecipeHeaderCellModel(imageUrl: image.url ?? "", isEditorChoice: recipeDetail.isEditorChoice))
        }
        userImageUrl = recipeDetail.user.image?.url
        userFollowedCount = recipeDetail.user.followedCount
        recipeName = recipeDetail.title
        recipeCount = recipeDetail.user.recipeCount
        categoryName = recipeDetail.category.name
        timeDifferenceText = recipeDetail.timeDifference
        recipeAndFollowerCountText = "\(recipeCount ?? 0 ) \(L10n.RecipeDetails.recipe) \(userFollowedCount ?? 0) \(L10n.RecipeDetails.follower)"
        commentCount = recipeDetail.commentCount
        likeCount = recipeDetail.likeCount
        ingredients = recipeDetail.ingredients
        numberOfPeople = recipeDetail.numberOfPerson.text
        recipeSteps = recipeDetail.instructions
        time = recipeDetail.timeOfRecipe.text
    }
}
// swiftlint:enable line_length
