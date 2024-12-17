//
//  ContentView.swift
//  Navigation
//
//  Created by Joshua Rosado Olivencia on 12/12/24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    // NavigatoinPath is what we call a TYPE-ERASER
    // it stores any kind of Hashable data without exposing exactly what type of data each item is.
    
    var body: some View {
        
        // BIND THE PATH to SOMETHING
        
        NavigationStack(path: $path){
            List{
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                    
                }
            }
            
            .toolbar {
                Button("Push 435") {
                    // adding an INT
                    path.append(435)
                }
                
                Button("Push Leya") {
                    // adding a String
                    path.append("Leya")
                }
            }
            
            // Destination  = Int itself
            .navigationDestination(for: Int.self) { selection in
            Text("You selected the number \(selection)")
            }
            
            // Destination = String itself
            .navigationDestination(for: String.self) { selection in
            Text("You selected the string \(selection)")
            }
        }
        
    }
}
    

#Preview {
    ContentView()
}
