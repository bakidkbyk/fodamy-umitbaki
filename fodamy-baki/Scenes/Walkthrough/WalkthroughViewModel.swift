//
//  WalkthroughViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

import Foundation

protocol WalkthroughViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol
}

protocol WalkthroughViewEventSource {}

protocol WalkthroughViewProtocol: WalkthroughViewDataSource, WalkthroughViewEventSource {
    func didFinishWalkthrough()
}

final class WalkthroughViewModel: BaseViewModel<WalkthroughRouter>, WalkthroughViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol {
        return cellItems[indexPath.row]
    }
    // swiftlint:disable line_length
    private var cellItems: [WalkthroughCellProtocol] = [WalkthroughCellModel(image:
                                                        .imgWalkthrough1, titleLabel: L10n.Walkthrough.firstImageTitle, descriptionLabel: L10n.Walkthrough.firstImageSubtitle),
                                                        WalkthroughCellModel(image: .imgWalkthrough2, titleLabel: L10n.Walkthrough.secondImageTitle, descriptionLabel: L10n.Walkthrough.secondImageSubtitle),
                                                        WalkthroughCellModel(image: .imgWalkthrough3, titleLabel: L10n.Walkthrough.thirdImageTitle, descriptionLabel: L10n.Walkthrough.thirdImagesubtitle),
                                                        WalkthroughCellModel(image: .imgWalkthrough4, titleLabel: L10n.Walkthrough.fourthImageTitle, descriptionLabel: L10n.Walkthrough.fourthImageSubtitle)]
    
}
// swiftlint:enable line_length

// MARK: - Actions
extension WalkthroughViewModel {
    
    func didFinishWalkthrough() {
        router.placeOnWindowLogin()
    }
}
