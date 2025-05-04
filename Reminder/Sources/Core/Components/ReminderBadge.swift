//
//  ReminderBadge.swift
//  Reminder
//
//  Created by Saulo Nascimento on 03/05/25.
//

import UIKit
import Foundation

final class ReminderBadge: UIView {
    
    // MARK: - Components
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.tag
        label.textColor = Colors.gray100
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.layer.cornerRadius = Metrics.regular
        stackView.backgroundColor = Colors.gray500
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins =
            .init(
                top: Metrics.small,
                left: Metrics.small,
                bottom: Metrics.small,
                right: Metrics.small
            )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(icon: UIImage) {
        super.init(frame: .zero)
        iconImageView.image = icon
        applyViewCode()
    }
    
    
    // MARK: - Setup
    
    public func setLabel(label: String) {
        titleLabel.text = label
    }
}

extension ReminderBadge: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(mainStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

#Preview {
    ReminderBadge(
        icon: UIImage(named: "clock")!
    )
}
