//
//  HomeViewModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 26/04/25.
//

final class HomeViewModel {
    let userDefaults: UserDefaultsManager
    
    var userModel: UserModel?
    
    init(userDefaults: UserDefaultsManager) {
        self.userDefaults = userDefaults
        loadUserModel()
    }
    
    private func loadUserModel() {
        userModel = userDefaults.loadUser()
    }
    
    func removeUserFromCache() {
        userDefaults.removeUser()
    }
}
