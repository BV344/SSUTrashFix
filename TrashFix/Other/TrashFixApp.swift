//
//  TrashFixApp.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//
import FirebaseCore
import SwiftUI

@main
struct TrashFixApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
