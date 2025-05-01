//
//  SharedCoordinatorDelegate.swift
//  Reminder
//
//  Created by Saulo Nascimento on 24/04/25.
//

public protocol SharedCoordinatorDelegate: AnyObject {
    func navigateToHome()
    func openLoginBottomSheet()
    func logout()
    func navigateToOnboarding(userModel: UserModel) 
    func navigateToNewReceipt() 
}
