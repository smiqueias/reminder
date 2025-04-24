//
//  LoginDelegate.swift
//  Reminder
//
//  Created by Saulo Nascimento on 24/04/25.
//

protocol LoginDelegate : AnyObject {
    func sendLoginData(email: String, password: String)
}
