//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

final class NewReceiptViewModel {
    
    let dbManager: DBManager
    
    init(dbManager: DBManager) {
        self.dbManager = dbManager
    }
    
    func addReceipt(recipe: RecipeModel) {
        dbManager.insertReceipt(recipe: recipe)
    }
}
