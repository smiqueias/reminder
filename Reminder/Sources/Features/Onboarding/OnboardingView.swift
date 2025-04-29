//
//  OnboardingView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 27/04/25.
//

import Foundation
import UIKit

final class OnboardingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Delegate
    public weak var delegate: OnboardingDelegate?
    
    // MARK: - Components
    
    private lazy var onboardingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, usernameTextField])
        stackView.axis = .vertical
        stackView.spacing = Metrics.medium
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reminder.Onboarding.label".localized
        label.font = Typography.titleLarge
        label.textColor = Colors.gray100
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Digite um nome".localized,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.gray200]
        )
        textField.borderStyle = .none
        textField.textAlignment = .center
        textField.font = Typography.input
        textField.textColor = Colors.gray200
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
        
        textField.addTarget(self, action: #selector(usernameInputDidChange), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reminder.Onboarding.button.label".localized, for: .normal)
        button.setTitleColor(Colors.gray800, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.layer.cornerRadius = Metrics.little
        button.backgroundColor = Colors.gray400
        button.addTarget(
            self,
            action: #selector(confirmButtonTapped),
            for: .touchUpInside
        )
        
        return button
    }()
    
    // MARK: - @objc
    @objc
    public func confirmButtonTapped() {
        if let username = usernameTextField.text, !username.isEmpty  {
            delegate?.onboardingDidFinish(username: username)
        }
    }
    
    @objc
    private func usernameInputDidChange() {
        validateConfirmButton()
    }
    
    private func validateConfirmButton() {
        confirmButton.isEnabled = !(usernameTextField.text ?? "").isEmpty
        confirmButton.backgroundColor = confirmButton.isEnabled ? Colors.primaryRedBase : Colors.gray400
    }
    
}

// MARK: - ViewCode

extension OnboardingView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        onboardingStackView.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(onboardingStackView)
        self.addSubview(confirmButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            onboardingStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            onboardingStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Metrics.huge),
            
            onboardingStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.big),
            onboardingStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.big),
        
            confirmButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.big),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.big),
            confirmButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        
    }
    
    
}

//#Preview {
//    OnboardingView()
//}
