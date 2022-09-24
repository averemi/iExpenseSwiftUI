//
//  ExpenseAmountModifier.swift
//  iExpenseSwiftUI
//
//  Created by Anastasiia Veremiichyk on 24/09/2022.
//

import Foundation
import SwiftUI

struct ExpenseAmountModifier: ViewModifier {
    var foregroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foregroundColor)
    }
}
