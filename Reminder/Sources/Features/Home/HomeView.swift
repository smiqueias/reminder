//
//  HomeView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import Foundation
import UIKit

final class HomeView: UIView, ViewCodeProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
        setupImageGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Delegate
    
    public weak var homeDelegate: HomeDelegate?
    
    // MARK: - Components
    
    private lazy var contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.medium
        view.backgroundColor = Colors.gray800
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true

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
    
    private lazy var feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reminder.Home.feedback.label".localized, for: .normal)
        button.setTitleColor(Colors.gray300, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.gray100
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    // MARK: - Setup
    func setupViewData(user: UserModel) {
        usernameLabel.text = user.username
    }
    
    private func setupImageGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleImageGesture))
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - @objc
    
    @objc
    private func handleImageGesture() {
        guard let homeDelegate = homeDelegate else { return }
        homeDelegate.didTapProfileImage()
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
        
        self.addSubview(contentBackground)
        contentBackground.addSubview(feedbackButton)
        
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
            
            
            contentBackground.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8, constant: -Metrics.big),
            contentBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            
            feedbackButton.trailingAnchor.constraint(equalTo: self.contentBackground.trailingAnchor, constant: -Metrics.big),
            feedbackButton.leadingAnchor.constraint(equalTo: self.contentBackground.leadingAnchor, constant: Metrics.big),
            feedbackButton.bottomAnchor.constraint(equalTo: self.contentBackground.bottomAnchor, constant: -Metrics.medium),
            
        ])
    }
}

//#Preview {
//    HomeView()
//}
