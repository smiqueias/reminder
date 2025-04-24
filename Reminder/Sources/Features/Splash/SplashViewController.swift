//
//  SplashViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 20/04/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    let splashView = SplashView()
   
    public weak var sharedCoordinatorDelegate: SharedCoordinatorDelegate?
    
    init(sharedCoordinatorDelegate: SharedCoordinatorDelegate) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        setup()
    }
    
    private func setup() {
        self.view.addSubview(splashView)
        setupConsstraints()
        setupGesture()
    }
    
    private func setupConsstraints() {
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalTo: view.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        splashView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLogin))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func showLogin() {
        guard let sharedCoordinatorDelegate = sharedCoordinatorDelegate else { return }
        sharedCoordinatorDelegate.openLoginBottomSheet()
    }
    
}
