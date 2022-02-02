//
//  HomeView.swift
//  ChessBook
//
//  Created by Laurent Klein on 31/01/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var inputMove: String = ""
    @State private var playedLine: String = ""
    @State private var playedLineName: String = ""
    
    var line = InputLine()
    
    var body: some View {
        ZStack {
//            Color.moreDarkerColor
//                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Played line name: \(playedLineName)")
                Text("Line played: \(playedLine)")
                Spacer()
                TextField("Next move here", text: $inputMove)
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    line.addMove(newMove: inputMove)
                    self.inputMove = ""
                    self.updateUI()
                }) {
                    Text("See the next move")
                }
                Spacer()
                Button(action: {
                    print(line.compareWithEntireBook())
                }) {
                    Text("Compare With Book")
                }
            }
        }
    }
    func updateUI()
    {
        self.playedLine = line.showLine()
        self.playedLineName = line.compareWithEntireBook()
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
