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
        checkUserData()
        setupActions()
    }
    
    private func setupNavigationBar() {
        self.view.backgroundColor = Colors.gray600
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logoutAction))
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func setupActions() {
        contentView.newRecipeCard.action = {
            [weak self] in
            self?.didTapNewPrescriptionButton()
        }
    }
    
    private func didTapNewPrescriptionButton() {
        guard let sharedCoordinatorDelegate = self.sharedCoordinatorDelegate else { return }
        sharedCoordinatorDelegate.navigateToNewReceipt()
    }
    
    // MARK: - HandleViewModel
    
    override func handleViewModel() {
        guard let userModel = homeViewModel.userModel else { return }
        self.contentView.setupViewData(user: userModel)
    }
    
    @objc
    private func logoutAction() {
        guard let sharedCoordinatorDelegate = self.sharedCoordinatorDelegate else { return }
        homeViewModel.removeUserFromCache()
        sharedCoordinatorDelegate.logout()
    }
    
    private func checkUserData() {
        if let savedImage = homeViewModel.userDefaults.loadProfileImage() {
            self.contentView.profileImage.image = savedImage
        }
    }
}

// MARK: - Delegate
extension HomeViewController: HomeDelegate {

   func setupDelegate() {
        self.contentView.homeDelegate = self
    }
    
    func didTapProfileImage() {
        selectProfileImage()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func selectProfileImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.contentView.profileImage.image = editedImage
            homeViewModel.userDefaults.saveProfileImage(image: editedImage)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.contentView.profileImage.image = originalImage
            homeViewModel.userDefaults.saveProfileImage(image: originalImage)
        }
        
        dismiss(animated: true)
        
    }
    
}
