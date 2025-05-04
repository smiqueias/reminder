//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> SplashViewController
    func makeLoginViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> LoginViewController
    func makeHomeViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> HomeViewController
    func makeOnboardingViewController(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        userModel: UserModel
    ) -> OnboardingViewController
    func makeNewReceiptViewController(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        newReceiptViewModel: NewReceiptViewModel
    ) -> NewReceiptViewController
    func makeMyRecipesViewController(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        viewModel: MyRecipesViewModel
    ) -> MyRecipesViewController
}
