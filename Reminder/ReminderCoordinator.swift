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
    private let viewControllersFactory: ViewControllersFactoryProtocol
    
    //MARK: - Login
    
    //MARK: - Home
    
    //MARK: - init
    public init() {
        self.viewControllersFactory = ViewControllersFactory()
    }
    
    //MARK: - Start
    func start() -> UINavigationController {
        let splashViewController = viewControllersFactory.makeSplashViewController(sharedCoordinatorDelegate: self)
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
        let loginViewController = viewControllersFactory.makeLoginViewController(sharedCoordinatorDelegate: self)
        loginViewController.modalPresentationStyle = .overCurrentContext
        loginViewController.modalTransitionStyle = .crossDissolve
        navigationController.present(loginViewController, animated: false) {
            loginViewController.animateToShow()
        }
        
    }
    
}

