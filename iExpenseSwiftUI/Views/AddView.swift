//
//  AddView.swift
//  iExpenseSwiftUI
//
//  Created by Anastasiia Veremiichyk on 18/09/2022.
//

import Foundation
import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type: ExpenseType = .personal
    @State private var amount = 0.0
    @Binding var expenses: Expenses
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: .constant(Expenses()))
    }
}
