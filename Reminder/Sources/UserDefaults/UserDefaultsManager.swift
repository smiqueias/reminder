//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import Foundation

final class UserDefaultsManager {
    
    private let userKey: String = "userKey"
    
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func saveUser(user: UserModel) -> Void {
        let encoder = JSONEncoder()
        if let userEncoded = try? encoder.encode(user) {
            UserDefaults.standard.set(userEncoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    func loadUser() -> UserModel? {
        guard let userData = UserDefaults.standard.data(forKey: userKey) else { return nil}
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(UserModel.self, from: userData) {
            return user
        }
        return nil
    }
}
