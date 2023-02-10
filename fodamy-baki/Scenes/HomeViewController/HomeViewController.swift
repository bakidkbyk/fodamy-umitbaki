//
//  ViewController.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 2.01.2023.
//

import Segmentio

class HomeViewController: BaseViewController<HomeViewModel> {

    private let segmentControlView: Segmentio = {
        let segmentControl = Segmentio()
        segmentControl.setup(content: [SegmentioItem(title: L10n.Home.editorChoices,
                                                     image: nil),
                                       SegmentioItem(title: L10n.Home.lassAdded,
                                                     image: nil)],
                                                     style: .onlyLabel,
                                                     options: .segmentioOptionsChanged())
        return segmentControl
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configure()
        setLocalize()
    }
}

// MARK: UILayout
extension HomeViewController {
    
    private func addSubviews() {
        addSegmentView()
    }
    
    private func addSegmentView() {
        view.addSubview(segmentControlView)
        segmentControlView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
}

// MARK: - Configure Contents and Localize
extension HomeViewController {
    
    private func configure() {
        view.backgroundColor = .appWhite
        segmentControlView.height(46)
    }
    
    private func setLocalize() {
        
    }
}
