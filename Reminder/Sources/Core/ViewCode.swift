//
//  ViewCode.swift
//  Reminder
//
//  Created by Saulo Nascimento on 23/04/25.
//

public protocol ViewCodeProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

public extension ViewCodeProtocol {
    
    func applyViewCode() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() { }
}
