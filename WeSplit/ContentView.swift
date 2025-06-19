//
//  ContentView.swift
//  WeSplit
//
//  Created by Vladislav Gorovenko on 19.06.2025.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
}

let people: [Person] = [
    Person(name: "Name 1"),
    Person(name: "Name 2"),
    Person(name: "Name 3"),
    Person(name: "Name 4"),
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ForEach(people) { Text($0.name) }
                }
            }
            .navigationTitle(Text("People"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
