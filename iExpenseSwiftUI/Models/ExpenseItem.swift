//
//  ExpenseItem.swift
//  iExpenseSwiftUI
//
//  Created by Anastasiia Veremiichyk on 24/09/2022.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
