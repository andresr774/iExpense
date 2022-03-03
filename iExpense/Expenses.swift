//
//  Expenses.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import Foundation

final class Expenses: ObservableObject {
    @Published var personalItems = [ExpenseItem]() { didSet { personalItemsDidSet() }}
    @Published var businessItems = [ExpenseItem]() { didSet { businessItemsDidSet() }}
    
    init() { setInitialValues() }
    
    private func setInitialValues() {
        if let savedPersonalItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedPersonalItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems) {
                personalItems = decodedPersonalItems
            }
        }
        if let savedBusinessItems = UserDefaults.standard.data(forKey: "BusinessItems") {
            if let decodedBusinessItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
                businessItems = decodedBusinessItems
            }
        }
    }
    
    private func personalItemsDidSet() {
        if let encoded = try? JSONEncoder().encode(personalItems) {
            UserDefaults.standard.set(encoded, forKey: "PersonalItems")
        }
    }
    
    private func businessItemsDidSet() {
        if let encoded = try? JSONEncoder().encode(businessItems) {
            UserDefaults.standard.set(encoded, forKey: "BusinessItems")
        }
    }
}
