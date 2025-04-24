//
//  LoginViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 20/04/25.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let loginView: LoginView = LoginView()
    let loginViewModel: LoginViewModel = LoginViewModel()
    var handleAreaHeight: CGFloat = 50.0
    public weak var sharedCoordinatorDelegate: SharedCoordinatorDelegate?
    
    init(sharedCoordinatorDelegate: SharedCoordinatorDelegate) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGesture()
        setupDelegate()
    }
    
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
     func animateToShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) {
            _ in completion?()
        }
    }
    
}

// MARK: - Delegate
extension LoginViewController: LoginDelegate {
    
   private func setupDelegate() {
        loginView.delegate = self
    }
    
    func sendLoginData(email: String, password: String) {
        loginViewModel.doLogin(email: email, password: password) {
            [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(auth):
                guard let sharedCoordinatorDelegate = self.sharedCoordinatorDelegate else { return }
                sharedCoordinatorDelegate.navigateToHome()
            case let .failure(error):
                print(error.localizedDescription)
            }
            
        }
    }
}
