//
//  ReminderCoordinator.swift
//  Reminder
//
//  Created by Saulo Nascimento on 24/04/25.
//

import UIKit

final class ReminderCoordinator {
    
    //MARK: - Properties
    private var navigationController: UINavigationController?
    
    //MARK: - Login
    
    //MARK: - Home
    
    //MARK: - init
    public init() {
        navigationController = UINavigationController()
    }
    
    //MARK: - Start
    func start() -> UINavigationController {
        let splashViewController = SplashViewController(sharedCoordinatorDelegate: self)
        let navigationController = UINavigationController(rootViewController: splashViewController)
        self.navigationController = navigationController
        return navigationController
    }
}

extension ReminderCoordinator: SharedCoordinatorDelegate {
    
    
    //MARK: - Home
    func navigateToHome() {
        guard let navigationController = navigationController else { return }
        navigationController.dismiss(animated: false)
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .systemBlue
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    //MARK: - Login
    func openLoginBottomSheet() {
        guard let navigationController = navigationController else { return }
        navigationController.dismiss(animated: false)
        let loginViewController = LoginViewController(sharedCoordinatorDelegate: self)
        loginViewController.modalPresentationStyle = .overCurrentContext
        loginViewController.modalTransitionStyle = .crossDissolve
        navigationController.present(loginViewController, animated: true)
        
    }
    
}

