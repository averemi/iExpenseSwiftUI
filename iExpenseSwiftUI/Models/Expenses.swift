//
//  Expenses.swift
//  iExpenseSwiftUI
//
//  Created by Anastasiia Veremiichyk on 24/09/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    
    @Published var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        if let savedPersonalItems = UserDefaults.standard.data(forKey: "PersonalItems"),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems) {
            personalItems = decodedItems
        }
        
        if let savedBusinessItems = UserDefaults.standard.data(forKey: "BusinessItems"),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
            businessItems = decodedItems
        }
    }
}
