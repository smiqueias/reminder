//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import Foundation
import UIKit

final class UserDefaultsManager {
    
    private let userKey: String = "userKey"
    private let profileImageKey: String = "profileImageKey"
    
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
    
    func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.removeObject(forKey: profileImageKey)
        UserDefaults.standard.synchronize()
    }
    
    func saveProfileImage(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            print("ImageData -- \(imageData)")
            UserDefaults.standard.set(imageData, forKey: profileImageKey)
        }
    }
    
    func loadProfileImage() -> UIImage? {
        guard let imageData = UserDefaults.standard.data(forKey: profileImageKey) else { return UIImage(systemName: "person.circle.fill")}
        return UIImage(data: imageData)
    }
}
