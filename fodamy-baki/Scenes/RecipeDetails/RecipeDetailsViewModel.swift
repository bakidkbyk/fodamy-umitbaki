//
//  RecipeDetailsViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 3.04.2023.
//

import Utilities
import KeychainSwift

protocol RecipeDetailsViewDataSource {
    var username: String? { get }
    var userId: Int? { get }
    var recipeHeaderImageUrl: String? { get }
    var userImageUrl: String? { get }
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
    var timeOfRecipe: String? { get }
}

protocol RecipeDetailsViewEventSource {}

protocol RecipeDetailsViewProtocol: RecipeDetailsViewDataSource, RecipeDetailsViewEventSource {
    func didSelectComment()
    func likeButtonTapped()
    func followButtonTapped()
    func commentButtonTapped()
}

final class RecipeDetailsViewModel: BaseViewModel<RecipeDetailsRouter>, RecipeDetailsViewProtocol {
    
    var username: String?
    var userId: Int?
    var recipeHeaderImageUrl: String?
    var userImageUrl: String?
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
    var timeOfRecipe: String?
    
    var imagesCellItems: [RecipeHeaderCellProtocol] = []
    var commentsCellItems: [CommentCellProtocol] = []
    private let recipeId: Int
    
    var isGetDataDidSuccess: VoidClosure?
    
    var likedStasus: VoidClosure?
    var followingStatus: VoidClosure?
    var unfollowShow: VoidClosure?
    var isFollowing = false
    var isLiked = false
    var followedId: Int?
    private let keychain = KeychainSwift()
    private let dispatchGroup = DispatchGroup()
    private var isGetRecipeDetailSuccess = false
    private var isGetRecipeCommentSuccess = false
    
    init(recipeId: Int, router: RecipeDetailsRouter) {
        self.recipeId = recipeId
        super.init(router: router)
    }
    
    var userFollowedCount: Int? {
        didSet {
            recipeAndFollowerCountText = "\(recipeCount ?? 0) Tarif \(userFollowedCount ?? 0) Takipçi"
        }
    }
    
    override func tryAgainButtonTapped() {
        self.hideTryAgainButton?()
        getData()
    }
}

// MARK: - Actions
extension RecipeDetailsViewModel {
    
    func didSelectComment() {
        router.pushCommentList(recipeId: recipeId)
    }
    
    func likeButtonTapped() {
        guard keychain.get(Keychain.token) != nil else {
            router.presentLogin()
            return
        }
        switch isLiked {
        case true:
            self.recipeslikeRequest(likeType: .unlike)
        case false:
            self.recipeslikeRequest(likeType: .like)
        }
    }
    
    func followButtonTapped() {
        guard keychain.get(Keychain.token) != nil else {
            router.presentLoginWarningUp { [weak self] in
                self?.router.presentLogin()
            }
            return
        }
        
        switch isFollowing {
        case true:
            self.unfollowShow?()
        case false:
            self.userFollowRequest(followType: .follow)
        }
    }
    
    func commentButtonTapped() {
        router.pushCommentList(recipeId: recipeId)
    }

}

// MARK: - Network
extension RecipeDetailsViewModel {
    
    func getRecipesDetail() {
        let request = GetRecipeDetailsRequest(recipeId: recipeId)
        dispatchGroup.enter()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.dispatchGroup.leave()
            switch result {
            case .success(let recipeDetails):
                self.setData(recipeDetail: recipeDetails)
                self.isGetRecipeDetailSuccess = true
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func getRecipesDetailsComment() {
        let request = GetRecipeCommentsRequest(recipeId: recipeId)
        dispatchGroup.enter()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.dispatchGroup.leave()
            switch result {
            case .success(let response):
                let cellItems = response.data.prefix(3).map({ CommentCellModel(comment: $0) })
                self.commentsCellItems.append(contentsOf: cellItems)
                self.isGetRecipeCommentSuccess = true
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func recipeslikeRequest(likeType: RecipesLikesRequest.LikeType) {
        let recipeId = self.recipeId
        showLoading?()
        let request = RecipesLikesRequest(recipeId: recipeId, likeType: likeType)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.likedStasus?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func userFollowRequest(followType: UserFollowRequest.FollowType) {
        guard let followedId = followedId else { return }
        let request = UserFollowRequest(followedId: followedId, followType: followType)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.followingStatus?()
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
        timeOfRecipe = recipeDetail.timeOfRecipe.text
        followedId = recipeDetail.user.id
        isFollowing = recipeDetail.user.isFollowing
    }
    
    func getData() {
        if !isGetRecipeDetailSuccess || !isGetRecipeCommentSuccess {
            showActivityIndicatorView?()
        }
        
        if !isGetRecipeDetailSuccess {
            getRecipesDetail()
        }
        
        if !isGetRecipeCommentSuccess {
            getRecipesDetailsComment()
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            if self.isGetRecipeDetailSuccess && self.isGetRecipeCommentSuccess {
                self.isGetDataDidSuccess?()
            } else {
                self.showTryAgainButton?()
            }
        }
    }
}
