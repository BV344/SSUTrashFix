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
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
