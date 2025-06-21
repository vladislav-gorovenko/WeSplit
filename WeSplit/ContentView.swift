//
//  ContentView.swift
//  WeSplit
//
//  Created by Vladislav Gorovenko on 19.06.2025.
//

import SwiftUI

let tipProcentages = [20, 30, 40, 50]

struct ContentView: View {
    @State private var amount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int  = 20
    
    var totalPerPerson: Double {
        return (amount * Double(tipPercentage + 100)/100) / Double(numberOfPeople);
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100, id: \.self) {
                        Text("\($0)").tag($0)
                    }
                   }
                   .pickerStyle(.navigationLink)
                Section("Tip percentage") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipProcentages, id: \.self) {
                            Text($0, format: .percent).tag($0)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Total per person") {
                    Text(totalPerPerson, format: .currency(code: "USD"))
                }
            }
            .navigationTitle(Text("WeSplit"))
        }
    }
}

#Preview {
    ContentView()
}
