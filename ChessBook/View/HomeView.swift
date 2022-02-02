//
//  HomeView.swift
//  ChessBook
//
//  Created by Laurent Klein on 31/01/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var inputMove: String = ""
    @State private var playedLine: String = "[Moves will be here]"
    @State private var playedLineName: String = "Line Name"
    @State private var nextMove: String = "Next Move"
    
    var line = InputLine()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text(playedLineName)
                    .font(.system(size: 45))
                Text(playedLine)
                Spacer()
                Text(nextMove)
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                Spacer()
                TextField("Enter Move Here", text: $inputMove)
                    .font(Font.system(size: 30, design: .default))
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    line.addMove(newMove: inputMove)
                    self.inputMove = ""
                    self.updateUI()
                }) {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 65, height: 65)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
        }
    }
    func updateUI()
    {
        self.playedLine = line.showLine()
        self.playedLineName = line.compareWithEntireBook()
        
        if !line.checkIfLineOutOfRange() {
            self.nextMove = line.showNextMove()
        } else {
            self.nextMove = "Out Of Range"
        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
