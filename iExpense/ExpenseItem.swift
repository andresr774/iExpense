//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

enum TypeOfExpense: String, CaseIterable {
    case business, personal
}
