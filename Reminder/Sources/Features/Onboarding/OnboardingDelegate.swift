//
//  OnboardingDelegate.swift
//  Reminder
//
//  Created by Saulo Nascimento on 27/04/25.
//

public protocol OnboardingDelegate: AnyObject {
    func onboardingDidFinish(username name: String)
}
