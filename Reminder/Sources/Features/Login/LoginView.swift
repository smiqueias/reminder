//
//  LoginView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 20/04/25.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    public weak var delegate: LoginDelegate?
    
    // MARK: - UI properties
    private lazy var handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.text =  "Reminder.Login.title".localized
        titleLabel.textAlignment = .center
        titleLabel.font = Typography.subHeading
        titleLabel.textColor = Colors.gray100
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Reminder.Login.email.label".localized
        emailLabel.textColor = Colors.gray100
        emailLabel.font = Typography.label
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Reminder.Login.email.placeholder".localized
        textField.bounds.inset(by: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0))
       
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: Metrics.small, height: self.frame.height))
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.borderStyle = .none
        textField.textColor = Colors.gray200
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Reminder.Login.password.label".localized
        emailLabel.textColor = Colors.gray100
        emailLabel.font = Typography.label
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: Metrics.small, height: self.frame.height))
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.borderStyle = .none
        textField.textColor = Colors.gray200
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reminder.Login.button.title".localized, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.setTitleColor(Colors.gray800, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    public func loginButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        delegate?.sendLoginData(email: email, password: password)
    }
    
}

extension LoginView: ViewCodeProtocol {
    func buildViewHierarchy() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        self.addSubview(handleArea)
        self.addSubview(titleLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.huge),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
    
}

//#Preview {
//    LoginView()
//}
