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
    
    func saveUser(user: User) -> Void {
        let encoder = JSONEncoder()
        if let userEncoded = try? encoder.encode(user) {
            UserDefaults.standard.set(userEncoded, forKey: userKey)
        }
    }
    
    func loadUser() -> User? {
        guard let userData = UserDefaults.standard.data(forKey: userKey) else { return nil}
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: userData) {
            return user
        }
        return nil
    }
}
