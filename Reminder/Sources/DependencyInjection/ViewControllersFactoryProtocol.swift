//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> SplashViewController
    func makeLoginViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> LoginViewController
    func makeHomeViewController(sharedCoordinatorDelegate: SharedCoordinatorDelegate) -> HomeViewController
}
