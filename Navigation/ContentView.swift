//
//  ContentView.swift
//  Navigation
//
//  Created by Joshua Rosado Olivencia on 12/12/24.
//

import SwiftUI



struct ContentView: View {
    // Using a path Destination
    @State private var path = [Int]()
    
    var body: some View {
        // Selecting path = $path
        NavigationStack(path: $path){
            VStack{
                Button("Show 32") { // Tap
                    path = [32] // Show 32
                }
                
                Button("Show 64"){
                    path.append(64) // Add 64 to the Path and Display it
                }
                
                Button("Show 32 then 64"){
                    path = [32,64] // Display 2 destinations in path
                }
                
            }
            // Destionation for Integer itself
            .navigationDestination(for: Int.self)
                { selection in // passing in a selection
                Text("You selected \(selection)")}
            
        }
    }
}

#Preview {
    ContentView()
}
