//
//  TrashFixItem.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//


import Foundation

struct TrashFixItem: Codable, Identifiable {
    let id: String
    let title: String
    let trashFixID: String
    var isDone: Bool
    
    var filledDate: Date?
    var unfilledDate: Date?
    
    mutating func setDone(_ state: Bool) {
        isDone = state
        if isDone {
            filledDate = Date()
        } else {
            unfilledDate = Date()
        }
    }
    
    func asDictionary() -> [String: Any] {
            return [
                "id": id,
                "title": title,
                "trashFixID": trashFixID,
                "isDone": isDone,
                "filledDate": filledDate ?? NSNull(),
                "unfilledDate": unfilledDate ?? NSNull()
            ]
        }
}
