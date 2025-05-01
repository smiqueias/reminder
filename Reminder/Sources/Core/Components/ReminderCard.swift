//
//  ReminderCard.swift
//  Reminder
//
//  Created by Saulo Nascimento on 30/04/25.
//

import Foundation
import UIKit

final class ReminderCard: UIView {
    
    // MARK: - Properties
    
    var action: (() -> Void)?
    
    private lazy var mainStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = Metrics.small
        stack.layer.cornerRadius = Metrics.small
        stack.alignment = .center
        stack.backgroundColor = Colors.gray700
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins =
            .init(
                top: Metrics.small,
                left: Metrics.small,
                bottom: Metrics.small,
                right: Metrics.small
            )
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var iconContainer: UIView = {
       let view = UIView()
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = Metrics.little
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = Typography.subHeading
        label.textColor = Colors.gray100
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
       let label = UILabel()
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping 
        
        return label
    }()
    
    private lazy var labelStack: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [
                titleLabel,
                subTitleLabel
            ]
        )
        stack.axis = .vertical
        stack.spacing = Metrics.little
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    init(icon: UIImage, title: String, subTitle: String, action: (() -> Void)? = nil) {
        super.init(frame: .zero)
        
        self.action = action
        
        iconImageView.image = icon
        titleLabel.text = title
        subTitleLabel.text = subTitle
        
        setupGestures()
        applyViewCode()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGestures() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(gestureRecognizer)
    }
    
    @objc
    func handleTap() {
        self.action?()
    }
    
}

// MARK: - ViewCode
extension ReminderCard: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(mainStack)
        
        
        mainStack.addArrangedSubview(iconContainer)
        mainStack.addArrangedSubview(labelStack)
        
        iconContainer.addSubview(iconImageView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStack.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.big),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.big),
            mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.big),
            mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            iconContainer.widthAnchor.constraint(equalToConstant: 80),
            iconContainer.heightAnchor.constraint(equalToConstant: 88),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor)
        ])
    }
    
}

//#Preview {
//    ReminderCard(
//        icon: UIImage(systemName: "bell")!,
//        title: "Minhas receitas",
//        subTitle: "Acompanhe os medicamentos e gerencie lembretes"
//    ) {
//        
//    }
//}
