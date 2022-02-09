//
//  BoardView.swift
//  ChessBook
//
//  Created by Laurent Klein on 09/02/2022.
//

import SwiftUI

struct BoardView: View {
    @State var whiteQueenPosition = CGPoint(x: 140, y: 300)
    @State var lastMove = ".."
    
    
    
    var body: some View {
            
        ZStack {
            ForEach (0..<4) { row in
                ForEach (0..<4) { col in
                    Square(col: 2 * col , row: 2 * row).fill(Color.gray)
                    Square(col: 2 * col + 1 , row: 2 * row + 1).fill(Color.gray)
                    Square(col: 2 * col + 1 , row: 2 * row).fill(Color.black)
                    Square(col: 2 * col , row: 2 * row + 1).fill(Color.black)
                }
            }
            Image("whiteQueen")
                .resizable()
                .frame(width: 40, height: 40)
                .position(whiteQueenPosition)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            whiteQueenPosition = value.location
                        }
                        .onEnded {_ in
                            whiteQueenPosition = identifyCell(piecePosition: whiteQueenPosition)
                        }
                )
            VStack {
                Spacer()
                Text("Last move: \(lastMove)")
                Text("x: \(whiteQueenPosition.x) y: \(whiteQueenPosition.y)")
                
            }
            
        }
    }
    
    func identifyCell(piecePosition: CGPoint) -> CGPoint {
        let cellY = 8 - (Int(piecePosition.y / 40))
        let cellX = 1 + (Int(piecePosition.x / 40))
        
        switch cellX {
        case 1:
            lastMove = "A\(cellY)"
        case 2:
            lastMove = "B\(cellY)"
        case 3:
            lastMove = "C\(cellY)"
        case 4:
            lastMove = "D\(cellY)"
        case 5:
            lastMove = "E\(cellY)"
        case 6:
            lastMove = "F\(cellY)"
        case 7:
            lastMove = "G\(cellY)"
        case 8:
            lastMove = "H\(cellY)"
            default:
                print("Not in the board")
        }
        
        return CGPoint(x: cellX * 40 - 20, y: (8 - cellY) * 40 + 20) //This value is meant to replace the piece in the center of the cell
    }
    
}







struct Square: Shape {
    var col: Int
    var row: Int
    
    let cellSide: CGFloat = 40
    let originX: CGFloat = 0 //(UIScreen.main.bounds.width - 50 * 8) / 2
    let originY: CGFloat = 0

    
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRect(CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        return path
    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
