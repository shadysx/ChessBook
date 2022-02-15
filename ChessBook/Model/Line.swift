//
//  BookLine.swift
//  ChessBook
//
//  Created by Laurent Klein on 01/02/2022.
//

import Foundation
import UIKit


//This structure is matching the json data structure of the opening dataset, for more info check the DataModel.swift file
struct BookLine: Decodable {
    var name: String
    var movesArray: [String]
}

class InputLine {
    
    private var openingFeed: [String]
    private var openingName: String
    private var inputCount: Int
        
    init(){
        self.openingFeed = []
        self.openingName = ""
        self.inputCount = 0
    }
    
    //This is the unique function that get data from the view
    func addMove(inputMove: String) -> Void {
        if inputMove != "" {
            self.openingFeed.append(inputMove)
            self.inputCount += 1
        }
    }
    
    /*
        This function cannot change the cycle order because they are dependant of each other
        1. getOpeningFeed()   -> Return String to view
        2. getOpeningName()   -> a) Set the openingName instance variable.
                               -> b) Return String to view
        3. getSuggestion      -> Return String to view
     */
    func getUIData(inputMove: String) -> [String] {
        var dataForView: [String] = []
        
        dataForView.append(getOpeningfeed())
        dataForView.append(getOpeningName())
        dataForView.append(getSuggestion())
        
        return dataForView // [String openingFeed, String openingName, String suggestion]
    }
    
    func getOpeningfeed() -> String {
        var retVal: String = ""
        for inputMove in self.openingFeed {
            retVal += " " + inputMove
        }
        
        return retVal
    }
    
    func getOpeningName() -> String {
        var retVal: String = "Add this opening to play it!"
        
        for i in 0 ..< book.count {
            if self.openingFeed.prefix(inputCount) == book[i].movesArray.prefix(inputCount) {
                    retVal = book[i].name
                }
        }
        
        self.openingName = retVal
        return retVal
    }
    
    func getSuggestion() -> String {
        var retVal: String = "Not Found"
        if openingName != "Not Found" && openingName != "" {
            for line in book {
                if line.name == openingName && line.movesArray.count > inputCount {
                    retVal = line.movesArray[inputCount]
                }
            }
        }

        return retVal
    }
    
    func restart() {
        openingFeed = []
        openingName = "Line Name"
        inputCount = 0
    }
    
}
