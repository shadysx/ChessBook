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
            
            HomeChessBoardView()
                .tabItem {
                    Label("Play", systemImage: "play.fill")
                }
            HelpView()
                .tabItem {
                    Label("Books", systemImage: "book.fill")
                }
        }
        
        
    }
}

    
