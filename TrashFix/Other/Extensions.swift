//
//  Extensions.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import Foundation
//Watch 1:12:00 of video to understand this
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
