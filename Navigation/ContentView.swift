//
//  ContentView.swift
//  Navigation
//
//  Created by Joshua Rosado Olivencia on 12/12/24.
//

import SwiftUI

struct DetailView: View {
    
    var number: Int
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List(0..<1000) { i in
                NavigationLink("Tap Me") {
                    DetailView(number: i)
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
