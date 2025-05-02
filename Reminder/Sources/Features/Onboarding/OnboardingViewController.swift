//
//  OnboardingViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 27/04/25.
//

import Foundation
import UIKit

final class OnboardingViewController: TemplateViewController<OnboardingView> {
    
    let sharedCoordinatorDelegate: SharedCoordinatorDelegate
    let userModel: UserModel
    let onboardingViewModel: OnboardingViewModel
    
    init(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        userModel: UserModel,
        onboardingViewModel: OnboardingViewModel
    ) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        self.userModel = userModel
        self.onboardingViewModel = onboardingViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDelegate()
    }
    
    override func setupView() {
        super.setupView()
        self.view.backgroundColor = Colors.gray600
    }
}

// MARK: - Delegate
extension OnboardingViewController: OnboardingDelegate {

    private func setupDelegate() {
        self.contentView.usernameTextField.delegate = self
        self.contentView.delegate = self
    }
    
    func onboardingDidFinish(username name: String) {
        let updatedUser = self.userModel.copyWith(username: name)
        onboardingViewModel.userDefaultsManager.saveUser(user: updatedUser)
        self.sharedCoordinatorDelegate.navigateToHome()
        
    }
}
