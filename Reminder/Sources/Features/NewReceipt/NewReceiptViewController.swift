//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import Foundation
import UIKit

final class NewReceiptViewController: TemplateViewController<NewReceiptView> {
    
    public weak var sharedCoordinatorDelegate: SharedCoordinatorDelegate?
    let newReceiptViewModel: NewReceiptViewModel
    
    init(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate? = nil,
        newReceiptViewModel: NewReceiptViewModel
    ) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        self.newReceiptViewModel = newReceiptViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView() {
        super.setupView()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = Colors.gray800
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAction()
    }
    
    private func setupAction() {
        contentView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        contentView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func addButtonTapped() {
        let recipe: RecipeModel = .init(
            medicine: contentView.typedMedicine,
            time: contentView.selectedHour,
            recurrence: contentView.selectedRecurrence,
            takeNow: false
        )
        newReceiptViewModel.addReceipt(recipe: recipe)
    }
    
}
