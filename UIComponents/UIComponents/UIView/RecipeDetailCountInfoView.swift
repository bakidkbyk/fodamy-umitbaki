//
//  CoutInfoView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 21.05.2023.
//

public class RecipeDetailsCountInfoView: UIView {
    
    private let iconButton = UIButtonBuilder()
        .tintColor(.appCinder)
        .build()
    
    private let stackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    
    private let countLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRed)
        .textAlignment(.center)
        .build()
    
    private let infoLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .textAlignment(.center)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    public var icon: UIImage? {
        willSet {
            iconButton.setImage(newValue?.resize(to: .init(width: 20, height: 18), for: .scaleAspectFit), for: .normal)
        }
    }
    
    public var count: Int? {
        willSet {
            countLabel.text = newValue?.toString
        }
    }
    
    public var info: String? {
        willSet {
            infoLabel.text = newValue
        }
    }
}
    
// MARK: - UILayout
extension RecipeDetailsCountInfoView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        addSubview(iconButton)
        
        iconButton.centerXToSuperview()
        iconButton.leadingToSuperview(relation: .equalOrGreater)
        iconButton.trailingToSuperview(relation: .equalOrLess)
        iconButton.topToSuperview().constant = 15
        iconButton.size(.init(width: 20, height: 18))
        
        addSubview(stackView)
        stackView.topToBottom(of: iconButton).constant = 7
        stackView.centerXToSuperview()
        stackView.leadingToSuperview(relation: .equalOrGreater)
        stackView.trailingToSuperview(relation: .equalOrLess)
        stackView.bottomToSuperview().constant = -15
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(infoLabel)
        
    }
}
