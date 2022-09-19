//
//  ContentView.swift
//  iExpenseSwiftUI
//
//  Created by Anastasiia Veremiichyk on 18/09/2022.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName).")

                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                
                Button("Show Sheet") {
                    showingSheet.toggle()
                }
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }

                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                }
            }
            .toolbar {
                EditButton()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: user.firstName)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
