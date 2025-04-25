//
//  SplashViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 20/04/25.
//

import Foundation
import UIKit

class SplashViewController: TemplateViewController<SplashView> {
   
    public weak var sharedCoordinatorDelegate: SharedCoordinatorDelegate?
    let userDefaultManager: UserDefaultsManager
    
    init(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        userDefaultManager: UserDefaultsManager
    ) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        self.userDefaultManager = userDefaultManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupView()
        setupGesture()
        startBreathingAnimation()
    }
    
    override func setupContentViewToBounds() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func handleNavigation() {
        guard let sharedCoordinatorDelegate = self.sharedCoordinatorDelegate else { return }
        if let user = userDefaultManager.loadUser(), user.isUserSaved {
            sharedCoordinatorDelegate.navigateToHome()
        } else {
            showLogin()
        }
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLogin))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func showLogin() {
        guard let sharedCoordinatorDelegate = sharedCoordinatorDelegate else { return }
        animateLogoUp()
        sharedCoordinatorDelegate.openLoginBottomSheet()
    }
    
}

extension SplashViewController {
    private func startBreathingAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0.0, animations: {
            self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.handleNavigation()
        })
    }
    
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: [.curveEaseOut],
                       animations: {
            self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -150)
        })
    }
}
