//
//  MyRecipesViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 02/05/25.
//

import Foundation
import UIKit

final class MyRecipesViewController: TemplateViewController<MyRecipesView> {
    
    public weak var sharedCoordinatorDelegate: SharedCoordinatorDelegate?
    let viewModel: MyRecipesViewModel
    
    init(
        sharedCoordinatorDelegate: SharedCoordinatorDelegate? = nil,
        viewModel: MyRecipesViewModel
    ) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtonAction()
        setupTableView()
        fetchRecipes()
        setupNotificationCenter()
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        contentView.medicineTableView.dataSource = self
        contentView.medicineTableView.delegate = self
        contentView.medicineTableView.register(MedicineCell.self, forCellReuseIdentifier: MedicineCell.identifier)
        contentView.medicineTableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    override func setupView() {
        super.setupView()
        self.view.backgroundColor = Colors.gray600
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupButtonAction() {
        contentView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        contentView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(fetchRecipes),
            name: .didAddNewItem,
            object: nil
        )
    }
    
    // MARK: - objc
    @objc
    private func backButtonTapped() {
        guard let navigationController = self.navigationController else { return }
        navigationController.popViewController(animated: false)
    }
    
    @objc
    private func addButtonTapped() {
        guard let sharedCoordinatorDelegate = self.sharedCoordinatorDelegate else { return }
        sharedCoordinatorDelegate.navigateToNewReceipt()
    }
    
    @objc
    private func fetchRecipes() {
        viewModel.fetchRecipes()
    }
    
}

// MARK: - TableViewDelegate
extension MyRecipesViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
}

// MARK: - TableViewDataSource
extension MyRecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineCell.identifier, for: indexPath) as! MedicineCell
        let recipe = viewModel.recipes[indexPath.section]
        cell.setupViewData(recipe: recipe)
        return cell
    }
}
