//
//  ContentView.swift
//  Navigation
//
//  Created by Joshua Rosado Olivencia on 12/12/24.
//

import SwiftUI
// Two ways for saving paths
// OPTION 1  -> Array of Int
// OPTION 2 -> NavigationPath()

@Observable
class PathStore {
    var path: [Int]{
        
        // OPTION 2 -> NavigationPath()
    // var path: NavigationPath()
        
        didSet { // When that changes
            save() // call func
        }
    }
    
    // Path to write things into
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    
    init() { // loading data back up and putting into the path array
        
        // if data is loaded
        if let data = try? Data(contentsOf: savePath) {
            
            // if found, loaded and decoded
            if let decoded = try?
                
                // OPTION 2 -> NavigationPath()
            // JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from :data)
                
                JSONDecoder().decode([Int].self, from :data) {
                // our path will be the following
                path = decoded
                
                // OPTION 2 -> NavigationPath()
                // make a path out of that decoded data
                
                // path = NavigationPath(decoded)
            
                return
            }
        }
        // if NO data was loaded, found and decoded
        // stay with an EMPTY path
        
        path = []
        // OPTION 2 -> NavigationPath()
        
        // path = NavigationPath()
    }
    
    func save() {
        
        // OPTION 2 -> NavigationPath()
        // retrieve our piece of data or bail out if there's nothing
        
        // adding this Check

    // guard let representation = path.codable else {return}
        
        do {
            
            // OPTION 2 -> NavigationPath()
        // let data = try JSONEncoder().encode(representation)
            
            // if data loaded and decoded
            let data = try JSONEncoder().encode(path)
            // write it and save into Path
            try data.write(to: savePath)
        } catch {
            // else display message
            print("Failed to save navigation data")
        }
    }
}

struct DetailView: View {
    var number: Int

    

    
    var body: some View {

        NavigationLink("Got to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            
        
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        
        NavigationStack(path: $pathStore.path){
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    
                    DetailView(number: i)
                }
            
        }
        
        
    }
}
    

#Preview {
    ContentView()
}
