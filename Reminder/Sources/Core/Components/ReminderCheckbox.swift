//
//  ReminderCheckbox.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import Foundation
import UIKit

final class Checkbox: UIButton {
    
    private var isChecked: Bool = false
    private let checkedImage = UIImage(named: "Checked")
    private let uncheckedImage = UIImage(named: "Unchecked")
    
    public init() {
        super.init(frame: .zero)
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func toggle() {
        isChecked.toggle()
        self.setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }
    
    public func getIsCheckedState() -> Bool {
        return isChecked
    }
}

final class ReminderCheckbox: UIView {
    
    private lazy var checkbox: Checkbox = {
        let checkbox = Checkbox()

        return checkbox
    }()
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray200
        label.font = Typography.input
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [checkbox, label])
        stackView.axis = .horizontal
        stackView.spacing = Metrics.small
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(label: String) {
        super.init(frame: .zero)
        self.label.text = label
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReminderCheckbox: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
