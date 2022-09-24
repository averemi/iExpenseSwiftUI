//
//  ContentView.swift
//  iExpenseSwiftUI
//
//  Created by Anastasiia Veremiichyk on 18/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type.rawValue)
                            }

                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                        .expenseStyle(amount: item.amount)
                    }
                    .onDelete(perform: removePersonalExpenseItems)
                }
                Section {
                    ForEach(expenses.businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type.rawValue)
                            }

                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                        .expenseStyle(amount: item.amount)
                    }
                    .onDelete(perform: removeBusinessExpenseItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    private func removePersonalExpenseItems(at offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    
    private func removeBusinessExpenseItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
