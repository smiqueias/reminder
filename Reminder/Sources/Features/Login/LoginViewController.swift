//
//  LoginViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 20/04/25.
//

import Foundation
import UIKit

class LoginViewController: TemplateViewController<LoginView> {
    
    let loginViewModel: LoginViewModel = LoginViewModel()
    let userDefaultManager: UserDefaultsManager
    var handleAreaHeight: CGFloat = 50.0
    public weak var sharedCoordinatorDelegate: SharedCoordinatorDelegate?
    
    init(sharedCoordinatorDelegate: SharedCoordinatorDelegate, userDefaultManager: UserDefaultsManager) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        self.userDefaultManager = userDefaultManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContentViewToBounds()
        setupGesture()
        setupDelegate()
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
    override func setupContentViewToBounds() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
     func animateToShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
         self.contentView.transform = CGAffineTransform(translationX: 0, y: self.contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) {
            _ in completion?()
        }
    }
    
    private func presentSaveLoginAlert(email: String) {
        guard let sharedCoordinatorDelegate = self.sharedCoordinatorDelegate else { return }
        let alertController = UIAlertController(title: "Salvar Acesso", message: "Deseja salvar seu acesso?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) {
            _ in
            self.userDefaultManager.saveUser(user: User(email: email,isUserSaved: true))
            
            sharedCoordinatorDelegate.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) {
            _ in
            sharedCoordinatorDelegate.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    private func presentErrorAlert() {
        let alertController = UIAlertController(title: "Email ou Senha Inválidos", message: "Por favor, verifique os dados e tente novamente.", preferredStyle: .alert)
        
        let tryAgainAction = UIAlertAction(title: "Tentar novamente", style: .default) {
            _ in
            alertController.dismiss(animated: true)
        }
        
        alertController.addAction(tryAgainAction)
        self.present(alertController, animated: true)
    }
    
}

// MARK: - Delegate
extension LoginViewController: LoginDelegate {
    
   private func setupDelegate() {
       contentView.delegate = self
    }
    
    func sendLoginData(email: String, password: String) {
        loginViewModel.doLogin(email: email, password: password) {
            [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(auth):
                guard let userEmail = auth.user.email else { return }
                presentSaveLoginAlert(email: userEmail)
            case let .failure(_):
                presentErrorAlert()
            }
            
        }
    }
}
