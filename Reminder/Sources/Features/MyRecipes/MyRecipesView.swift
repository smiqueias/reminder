//
//  MyRecipesView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 02/05/25.
//

import Foundation
import UIKit

final class MyRecipesView: UIView {
    
    // MARK: - Components
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add-plus"), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Minhas receitas"
        label.textColor = Colors.primaryBlueBase
        label.font = Typography.heading
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Acompanhe seus medicamentos cadastrados e gerencie lembretes"
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var appBarStackView: UIStackView = {
        
        let stackView = UIStackView(
            arrangedSubviews: [
                backButton,
                UIView(),
                addButton
            ]
        )
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel,
                descriptionLabel
            ]
        )
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var medicineTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                medicineTableView
            ]
        )
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.layer.backgroundColor = Colors.gray800.cgColor
        stackView.layer.cornerRadius = Metrics.medium
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(
            top: 0,
            left: Metrics.medium,
            bottom: 0,
            right: Metrics.medium
        )
        
        return stackView
    }()
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
    }
}

// MARK: - ViewCode
extension MyRecipesView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(appBarStackView)
        addSubview(headerStackView)
        addSubview(bodyStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            appBarStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.big),
            appBarStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            appBarStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            headerStackView.topAnchor.constraint(equalTo: appBarStackView.bottomAnchor, constant: Metrics.medium),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            bodyStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8, constant: -Metrics.big),
            bodyStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: Metrics.medium),
            bodyStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            medicineTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Metrics.big),
            
        ])
    }
}

#Preview {
    MyRecipesView()
}
