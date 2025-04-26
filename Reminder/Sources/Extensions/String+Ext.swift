//
//  String+Ext.swift
//  Reminder
//
//  Created by Saulo Nascimento on 21/04/25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
