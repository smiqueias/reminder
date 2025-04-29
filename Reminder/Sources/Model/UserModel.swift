//
//  UserModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import Foundation

public struct UserModel: Codable, Equatable, CustomStringConvertible {
    let email: String
    let username: String
    let isUserSaved: Bool
    
    init(email: String, username: String = "-", isUserSaved: Bool) {
        self.email = email
        self.username = username
        self.isUserSaved = isUserSaved
    }

   public var description: String {
            return "UserModel(email: \(email), username: \(username), isUserSaved: \(isUserSaved))"
        }
    
    func copyWith(
        email: String? = nil,
        username: String? = nil,
        isUserSaved: Bool? = nil
    ) -> UserModel {
        return UserModel(
            email: email ?? self.email,
            username: username ?? self.username,
            isUserSaved: isUserSaved ?? self.isUserSaved
        )
    }
}
