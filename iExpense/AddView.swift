//
//  AddView.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var amount: Double?
    var allTypes = TypeOfExpense.allCases
    @State private var typeSelected = TypeOfExpense.personal
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $typeSelected) {
                    ForEach(allTypes, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    guard name != "", let amount = amount, amount > 0 else {
                        dismiss()
                        return
                    }
                    let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                    let item = ExpenseItem(name: trimmedName, type: typeSelected.rawValue, amount: amount)
                    if typeSelected == .personal {
                        expenses.personalItems.append(item)
                    } else {
                        expenses.businessItems.append(item)
                    }
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
