//
//  WalkthroughCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 3.02.2023.
//

public protocol WalkthrouhgCellDataSource: AnyObject {
    var image: UIImage { get }
    var titleLabel: String { get }
    var descriptionLabel: String { get }
}

public protocol WalkthroughCellEventSource: AnyObject { }

public protocol WalkthroughCellProtocol: WalkthrouhgCellDataSource, WalkthroughCellEventSource { }

public class WalkthroughCellModel: WalkthroughCellProtocol {
    
    public var image: UIImage
    public var titleLabel: String
    public var descriptionLabel: String
    
    public init(image: UIImage, titleLabel: String, descriptionLabel: String) {
        self.image = image
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
    }
}
