//
//  View+Extension.swift
//  iExpenseSwiftUI
//
//  Created by Anastasiia Veremiichyk on 24/09/2022.
//

import Foundation
import SwiftUI

extension View {
    func expenseStyle(amount: Int) -> some View {
        switch amount {
        case 0...10:
            return AnyView(smallAmountStyle())
        case 10...100:
            return AnyView(mediumAmountStyle())
        default:
            return AnyView(bigAmountStyle())
        }
    }
    
    private func smallAmountStyle() -> some View {
        modifier(ExpenseAmountModifier(foregroundColor: .green))
    }
    
    private func mediumAmountStyle() -> some View {
        modifier(ExpenseAmountModifier(foregroundColor: .yellow))
    }
    
    private func bigAmountStyle() -> some View {
        modifier(ExpenseAmountModifier(foregroundColor: .red))
    }
}
