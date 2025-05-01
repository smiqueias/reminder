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
    
    init(sharedCoordinatorDelegate: SharedCoordinatorDelegate? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
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
    }
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
