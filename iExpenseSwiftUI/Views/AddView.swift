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
    @State var expenses: Expenses

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
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
