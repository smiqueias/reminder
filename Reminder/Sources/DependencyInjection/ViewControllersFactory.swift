//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

final class ViewControllersFactory: ViewControllersFactoryProtocol  {
    
    func makeSplashViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> SplashViewController {
        let viewController = SplashViewController(
            sharedCoordinatorDelegate: sharedCoordinatorDelegate,
            userDefaultManager: .shared
        )
        return viewController
    }
    
    func makeLoginViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> LoginViewController {

        let viewController = LoginViewController(
            sharedCoordinatorDelegate: sharedCoordinatorDelegate,
            userDefaultManager: .shared
        )
        return viewController
    }
    
    func makeHomeViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> HomeViewController {

        let viewController = HomeViewController(
            sharedCoordinatorDelegate: sharedCoordinatorDelegate,
            homeViewModel: .init(userDefaults: .shared)
        )
        return viewController
    }
    
    func makeOnboardingViewController(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        userModel: UserModel
    ) -> OnboardingViewController {
        
        let viewModel = OnboardingViewModel(
            userDefaultsManager: .shared
        )
        
        let viewController = OnboardingViewController(
            sharedCoordinatorDelegate: sharedCoordinatorDelegate,
            userModel: userModel,
            onboardingViewModel: viewModel
        )
        return viewController
    }
    
    func makeNewReceiptViewController(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        newReceiptViewModel: NewReceiptViewModel
    ) -> NewReceiptViewController {

        let viewController = NewReceiptViewController(
            sharedCoordinatorDelegate: sharedCoordinatorDelegate,
            newReceiptViewModel: newReceiptViewModel
        )
        return viewController
    }
    
    func makeMyRecipesViewController(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate,
        viewModel: MyRecipesViewModel
    ) -> MyRecipesViewController {
    
        let viewController = MyRecipesViewController(
            sharedCoordinatorDelegate: sharedCoordinatorDelegate,
            viewModel: viewModel
        )
        return viewController
    }
}
