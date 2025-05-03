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
    
    init(sharedCoordinatorDelegate: SharedCoordinatorDelegate? = nil) {
        self.sharedCoordinatorDelegate = sharedCoordinatorDelegate
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.backgroundColor = Colors.gray600
        self.navigationController?.isNavigationBarHidden = true
    }
}
