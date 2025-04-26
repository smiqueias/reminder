//
//  HomeViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import Foundation
import UIKit

final class HomeViewController: TemplateViewController<HomeView> {
    
    public weak var sharedCoordinatorDelegate: SharedCoordinatorDelegate?
    let homeViewModel: HomeViewModel
    
    init(sharedCoordinatorDelegate: SharedCoordinatorDelegate, homeViewModel: HomeViewModel) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.view.backgroundColor = Colors.gray600
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logoutAction))
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    // MARK: - HandleViewModel
    
    override func handleViewModel() {
        guard let userModel = homeViewModel.userModel else { return }
        self.contentView.setupViewData(user: userModel)
    }
    
    @objc
    private func logoutAction() {
        print("logout...")
    }
}

// MARK: - Delegate
extension HomeViewController: HomeDelegate {

   func setupDelegate() {
        self.contentView.homeDelegate = self
    }
}
