//
//  PageController.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.02.2023.
//

public class PageControl: UIPageControl {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        tintColor = .appRed
        pageIndicatorTintColor = UIColor.appRed.withAlphaComponent(0.3)
        currentPageIndicatorTintColor = .appRed
    }
}
