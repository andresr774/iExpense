//
//  ItemRow.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import SwiftUI

struct ItemRow: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .font(.headline)
                .foregroundColor(
                    item.amount < 10 ? .green :
                        item.amount < 100 ? .orange : .red
                )
        }
        .accessibilityElement()
        .accessibilityLabel("\(item.name) \(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
        .accessibilityHint(item.type)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: ExpenseItem(name: "Lunch", type: "Personal", amount: 80))
    }
}
