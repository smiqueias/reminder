//
//  UserModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let username: String
    let isUserSaved: Bool
}
