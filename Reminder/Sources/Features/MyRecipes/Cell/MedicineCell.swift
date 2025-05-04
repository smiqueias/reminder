//
//  MedicineCell.swift
//  Reminder
//
//  Created by Saulo Nascimento on 02/05/25.
//

import Foundation
import UIKit

final class MedicineCell: UITableViewCell {
    
    static let identifier = "MedicineCell"
    
    // MARK: - Components
    private lazy var medicineNameLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.subHeading
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var trashButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "trash"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            medicineNameLabel,
            UIView(),
            trashButton
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var timeBadge: ReminderBadge = {
        let badge = ReminderBadge(
            icon: UIImage(named: "clock")!
        )
        badge.translatesAutoresizingMaskIntoConstraints = false
        return badge
    }()
    
    lazy var recurrenceBadge: ReminderBadge = {
        let badge = ReminderBadge(
            icon: UIImage(named: "repeat")!
        )
        badge.translatesAutoresizingMaskIntoConstraints = false
        return badge
    }()
    
    private lazy var badgeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            timeBadge,
            recurrenceBadge
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = Metrics.little
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyViewCode()
    }
    
    // MARK: - Setup
    
    public func setupViewData(
        recipe :RecipeModel
    ) {
        medicineNameLabel.text = recipe.medicine
        timeBadge.setLabel(label: recipe.time)
        recurrenceBadge.setLabel(label: recipe.recurrence)
    }
}

// MARK: ViewCode
extension MedicineCell: ViewCodeProtocol {
    
    func configureViews() {
        contentView.backgroundColor = Colors.gray700
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = Metrics.small
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(topStackView)
        contentView.addSubview(badgeStackView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.regular),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.regular),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.regular),
            
            
            badgeStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: Metrics.regular),
            badgeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.regular),
            
            trashButton.heightAnchor.constraint(equalToConstant: Metrics.regular),
            trashButton.widthAnchor.constraint(equalToConstant: Metrics.regular)
            
        ])
    }
}

#Preview {
    MedicineCell()
}
