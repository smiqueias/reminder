//
//  TemplateViewController.swift
//  Reminder
//
//  Created by Saulo Nascimento on 25/04/25.
//

import UIKit

class TemplateViewController<CustomView: UIView>: UIViewController {
    
    public let contentView: CustomView = CustomView()
    
    open func setupView() {
        view.addSubview(contentView)
        setupContentViewToBounds()
    }
    
    open func setupContentViewToBounds() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
