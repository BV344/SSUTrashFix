//
//  User.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
