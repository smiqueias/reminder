//
//  HomeView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import Foundation
import UIKit

final class HomeView: UIView, ViewCodeProtocol {
    
    // MARK: - Delegate
    
    public weak var homeDelegate: HomeDelegate?
    
    // MARK: - Components
    
    private lazy var profileStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.distribution = .fillEqually

        
        return stack
    }()
    
    private lazy var welcomeStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        
        
        return stack
    }()
    
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Reminder.Home.password.label".localized
        label.textColor = Colors.gray200
        label.font = Typography.subHeading
        return label
    }()
    
   private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.heading
        label.textColor = Colors.gray100

        return label
    }()
    
    // MARK: - Setup
    func setupViewData(user: UserModel) {
        usernameLabel.text = user.username
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode

extension HomeView {
    
    func buildViewHierarchy() {
        
        profileStack.addArrangedSubview(profileImage)
        
        profileStack.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeStackView.addArrangedSubview(welcomeLabel)
        welcomeStackView.addArrangedSubview(usernameLabel)
        welcomeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(profileStack)
        self.addSubview(welcomeStackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            
            profileStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Metrics.big),
            profileStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.big),
            profileStack.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            welcomeStackView.topAnchor.constraint(equalTo: profileStack.bottomAnchor, constant: Metrics.regular),
            welcomeStackView.leadingAnchor.constraint(equalTo:  self.leadingAnchor, constant: Metrics.big),
        ])
    }
}

//#Preview {
//    HomeView()
//}
