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
    @State private var suggestion: String = "Next Move"
    
    var line = InputLine()
    
    var body: some View {
        ZStack {
//            Color.black
//                .ignoresSafeArea()
            VStack {
                
                Text(playedLineName)
                    .font(.system(size: 45))
                Text(playedLine)
                
                Text(suggestion)
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                
                BoardView()
                    .border(Color.red)
                TextField("Enter Move Here", text: $inputMove)
                    .font(Font.system(size: 30, design: .default))
                    .padding()
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    self.updateUI()
                    self.inputMove = ""
                }) {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 65, height: 65)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    func updateUI()
    {
        var uiText: [String]
        
        //Adding a move
        self.line.addMove(inputMove: inputMove)
        //Request data
        uiText = self.line.getUIData(inputMove: inputMove)
        
        //Affecting the data to UIObjects
        self.playedLine = uiText[0]
        self.playedLineName = uiText[1]
        self.suggestion = uiText[2]
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
