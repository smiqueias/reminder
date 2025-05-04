//
//  MyRecipesViewModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 03/05/25.
//

final class MyRecipesViewModel {
    
    let dbManager: DBManager
    
    var recipes: [RecipeModel] = []
    
    init(dbManager: DBManager) {
        self.dbManager = dbManager
    }
    
    func fetchRecipes() {
        recipes = dbManager.fetchRecipes()
    }
    
}
