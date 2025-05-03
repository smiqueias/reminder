//
//  ReminderInput.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import Foundation
import UIKit

final class ReminderInput: UIView {
    
    var onChange: ((String) -> Void)?
    
    // MARK: - Components
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.label
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = Typography.input
        textField.textColor = Colors.gray100
        textField.borderStyle = .roundedRect
        textField.backgroundColor = Colors.gray800
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.heightAnchor.constraint(equalToConstant: Metrics.inputSize).isActive = true
        
        textField.addTarget(self, action: #selector(inputDidChange), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    init(label: String, placeholder: String, onChange: ((String) -> Void)? = nil) {
        super.init(frame: .zero)
        applyViewCode()
        titleLabel.text = label
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: Colors.gray200]
        )
        
        
        self.onChange = onChange
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func inputDidChange() {
        self.onChange?(textField.text ?? "")
    }
}

// MARK: - ViewCode

extension ReminderInput: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

#Preview {
    ReminderInput(
        label: "Remédio",
        placeholder: "Insira o nome do seu remédio"
    )
}
