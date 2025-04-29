//
//  OnboardingViewModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 28/04/25.
//

final class OnboardingViewModel {
    let userDefaultsManager: UserDefaultsManager
    
    init(userDefaultsManager: UserDefaultsManager) {
        self.userDefaultsManager = userDefaultsManager
    }
}
