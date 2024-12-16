//
//  ContentView.swift
//  Navigation
//
//  Created by Joshua Rosado Olivencia on 12/12/24.
//

import SwiftUI

// Hashing
// is a computer science term that is the process of converting some data into a smaller representation in a consistent way


struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List(0..<100) { i in
                // title - i, value itself - i
                NavigationLink("Select \(i)", value: i)
            }
            
            // navigationLink selected will display itself
            // if Select 2 is taped, "You selected 2" will be displayed
            .navigationDestination(for: Int.self) { selection in
                Text( "You selected \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text( "You selected \(student)")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
