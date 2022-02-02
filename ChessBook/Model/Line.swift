//
//  BookLine.swift
//  ChessBook
//
//  Created by Laurent Klein on 01/02/2022.
//

import Foundation
import SwiftUI


class BookLine: Decodable {
    
    var name: String
    var movesArray: [String]
}



class InputLine {
    
    var name: String = ""
    var movesArray: [String] = []
    var movesCount = 0
    
    public func addMove(newMove: String) -> Void {
        movesArray.append(newMove.lowercased())
        self.movesCount += 1
    }
    
    func showLine() -> String {
        var retVal: String = ""
        
        for move in movesArray {
            retVal = retVal + " " + move
        }
        
        return retVal
    }
    
    func compareWithBook(bookLineObject: BookLine) -> Bool {
        let bookLine = bookLineObject.movesArray
        let inputLine = self.movesArray
        var isLineSame = true
        
        for i in 0...movesCount - 1 {
            print("Bookline = \(bookLine[i])")
            print("Inputline = \(inputLine[i])")
            if bookLine[i] != inputLine[i] {
                isLineSame = false
            }
        }
        return isLineSame
    }
    
//    Note that if there are 2 corresponding lines only the last will be returned
    func compareWithEntireBook() -> String {
        var lineName = "Freestyle"
        for line in book {
            if compareWithBook(bookLineObject: line) {
                lineName = line.name
            }
        }
        return lineName
    }
    
}
