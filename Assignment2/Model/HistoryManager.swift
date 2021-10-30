//
//  HistoryManager.swift
//  Assignment2
//
//  Created by user202299 on 10/27/21.
//

import Foundation

class HistoryManager {
    var history = [History]()
    
    func addNewHistory(newHistory: History){
        history.append(newHistory)
    }
    
    func getAllHistory() -> [History]{
        return history;
    }
    
}
