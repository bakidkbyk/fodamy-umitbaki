//
//  WalkthroughViewModel.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 31.01.2023.
//

import Foundation

protocol WalkthroughViewDataSource {}

protocol WalkthroughViewEventSource {}

protocol WalkthroughViewProtocol: WalkthroughViewDataSource, WalkthroughViewEventSource {}

final class WalkthroughViewModel: BaseViewModel<WalkthroughRouter>, WalkthroughViewProtocol {
    
}
