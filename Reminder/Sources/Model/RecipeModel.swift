//
//  RecipeModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

struct RecipeModel: Equatable {
    let id: Int?
    let medicine: String
    let time: String
    let recurrence: String
    let takeNow: Bool
    
    init(
        id: Int? = nil,
        medicine: String,
        time: String,
        recurrence: String,
        takeNow: Bool
    ) {
        self.id = id
        self.medicine = medicine
        self.time = time
        self.recurrence = recurrence
        self.takeNow = takeNow
    }
}
