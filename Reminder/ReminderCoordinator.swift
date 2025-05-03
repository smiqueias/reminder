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
        let homeViewController = viewControllersFactory.makeHomeViewController(sharedCoordinatorDelegate: self)
        navigationController.pushViewController(homeViewController, animated: false)
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
    
    // MARK: - Logout
    func logout() {
        guard let navigationController = navigationController else { return }
        navigationController.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
    
    // MARK: - Onboarding
    func navigateToOnboarding(userModel: UserModel) {
        guard let navigationController = navigationController else { return }
        navigationController.dismiss(animated: false)
        let onboardingViewController = viewControllersFactory.makeOnboardingViewController(
            sharedCoordinatorDelegate: self,
            userModel: userModel
        )
        navigationController.pushViewController(onboardingViewController, animated: false)
    }
    
    // MARK: - New Receipt
    func navigateToNewReceipt() {
        guard let navigationController = navigationController else { return }
        let viewModel = NewReceiptViewModel(dbManager: .shared)
        let newReceiptViewController = viewControllersFactory.makeNewReceiptViewController(
            sharedCoordinatorDelegate: self,
            newReceiptViewModel: viewModel
        )
        navigationController.pushViewController(newReceiptViewController, animated: false)
    }
}

