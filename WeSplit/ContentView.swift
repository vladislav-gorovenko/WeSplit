//
//  ContentView.swift
//  WeSplit
//
//  Created by Vladislav Gorovenko on 19.06.2025.
//

import SwiftUI

struct Person: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
}

struct ContentView: View {
    @State private var person: Person? = nil
    let people = [
        Person(name: "Asya"),
        Person(name: "Zakhar"),
        Person(name: "Alina"),
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select a person", selection: $person) {
                    ForEach(people) { person in
                        Text(person.name)
                            .tag(person)
                    }
                }
            }
            .navigationTitle(Text("Navigation header"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
