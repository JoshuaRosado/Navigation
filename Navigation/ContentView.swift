//
//  ContentView.swift
//  Navigation
//
//  Created by Joshua Rosado Olivencia on 12/12/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: [Int]
    
    // The @Binding property wrapper lets us pass an @State property into a another view and modify it from there
      
    // *** Using NavigationPath()
//    @Binding var path: NavigationPath
    
    var body: some View {
        // Value pushed is a random Int between 1 - 1000
        NavigationLink("Got to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar{
                Button("Home"){
                    path.removeAll() // CLEAR EVERYTHING IN THE PATH
                    
                    // *** Using NavigationPath()
                    // path = an empty path
//                    path = NavigationPath()
                }
            }
        
    }
}

struct ContentView: View {
    // Array for a path to generate random INT into it
    @State private var path = [Int]()
    
    // *** Using NavigationPath()
//    @State private var path = NavigationPath()
    var body: some View {
        
        NavigationStack(path: $path){
            DetailView(number: 0, path: $path) // initial value of 0
                .navigationDestination(for: Int.self) { i in
                    // every Random INT generated, will become the path once selected
                    DetailView(number: i, path: $path)
                }
            
        }
        
        
    }
}
    

#Preview {
    ContentView()
}
