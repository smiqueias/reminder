//
//  DBManager.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import Foundation
import SQLite3

class DBManager {
    static let shared = DBManager()
    private var db: OpaquePointer?
    
    private init() {
        openDatabase()
        createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Reminder.sqlite")
        
        if sqlite3_open(fileURL.path(), &db) != SQLITE_OK {
            print("Erro ao abrir o banco de dados")
        }
    }
    
    private func createTable() {
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS Receipts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            medicine TEXT,
            time TEXT,
            recurrence TEXT,
            takeNow INTEGER
        );
        """
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createTableQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Tabela criada com sucesso")
            } else {
                print("Erro ao criar tabela")
            }
        } else {
            print("CreateTable statement não conseguiu executar")
        }
        sqlite3_finalize(statement)
    }
    
    func insertReceipt(recipe: RecipeModel) {
        let insertQuery = "INSERT INTO Receipts (medicine, time, recurrence, takeNow) VALUES (?, ?, ?, ?);"
        var statement: OpaquePointer?
        
        if (sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK) {
            sqlite3_bind_text(statement, 1, (recipe.medicine as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (recipe.time as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (recipe.recurrence as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 4, (recipe.takeNow ? 1 : 0))
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Receita inserida com sucesso !")
            } else {
                print("Falha ao inserir receita na tabela")
            }
        } else {
            print("INSERT statement falhou")
        }
        sqlite3_finalize(statement)
    }
    
    func fetchRecipes() -> [RecipeModel] {
        
        let fetchQuery = "SELECT medicine, time, recurrence FROM Receipts;"
        
        var statement: OpaquePointer?
        var recipes: [RecipeModel] = []
        
        if sqlite3_prepare(db, fetchQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let medicine = String(cString: sqlite3_column_text(statement, 0))
                let time = String(cString: sqlite3_column_text(statement, 1))
                let recurrence = String(cString: sqlite3_column_text(statement, 2))
                recipes.append(
                    RecipeModel(
                        medicine: medicine,
                        time: time,
                        recurrence: recurrence,
                        takeNow: false
                    )
                )
            }
        } else {
            print("SELECT statement falhou")
        }
        
        sqlite3_finalize(statement)
        return recipes
    }
}
