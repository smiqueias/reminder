//
//  ReminderLoader.swift
//  Reminder
//
//  Created by Saulo Nascimento on 28/04/25.
//

import Foundation
import UIKit

final class ReminderLoader {
    
    // MARK: - Singleton
    static let shared = ReminderLoader()
    
    // MARK: - Properties
    
    private var loaderView: UIView?

    private init() {}
    
   func presentLoader(on view: UIView) {
        guard loaderView == nil else { return }
        guard let bounds = view.window?.windowScene?.screen.bounds else { return }
        
        let overlay = UIView(frame: bounds)
        overlay.backgroundColor = Colors.loaderBackground
        
        let loaderIndicator = UIActivityIndicatorView(style: .large)
        loaderIndicator.color = Colors.gray800
        loaderIndicator.center = overlay.center
        loaderIndicator.startAnimating()
        
        overlay.addSubview(loaderIndicator)
        view.addSubview(overlay)
        
        loaderView = overlay
    }
    
    func removeLoader() {
        self.loaderView?.removeFromSuperview()
        self.loaderView = nil
    }
}
