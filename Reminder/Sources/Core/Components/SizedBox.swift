//
//  SizedBox.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import UIKit

final class SizedBox: UIView {
    
    init(height: CGFloat? = nil, width: CGFloat? = nil) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
