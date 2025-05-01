//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import Foundation
import UIKit

final class NewReceiptView: UIView {
    
    // MARK: - Components
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Nova receita"
        label.textColor = Colors.primaryRedBase
        label.font = Typography.heading
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicione a sua prescrição médica para receber lembretes de quando tomar seu medicamento"
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                backButton,
                titleLabel,
                descriptionLabel
            ]
        )
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
        
    }
}

// MARK: - ViewCode

extension NewReceiptView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
        ])
    }
}

#Preview {
    NewReceiptView()
}
