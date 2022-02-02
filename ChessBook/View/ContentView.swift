//
//  ContentView.swift
//  ChessBook
//
//  Created by Laurent Klein on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            HelpView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
