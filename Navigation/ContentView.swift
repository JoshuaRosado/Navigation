//
//  ContentView.swift
//  Navigation
//
//  Created by Joshua Rosado Olivencia on 12/12/24.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            // navbar background color
            .toolbarBackground(.blue)
            // applying colorScheme for text in navbar
            .toolbarColorScheme(.dark)
            // making navbar hidden, for: Specify navbar
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
    

#Preview {
    ContentView()
}
