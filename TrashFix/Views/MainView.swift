//
//  ContentView.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @State var trashFixItems: [TrashFixItem] = []
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    //This is the 2 tabs once logged in
    @ViewBuilder
    var accountView: some View {
        TabView {
            TrashFixView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            LogView(trashFixItems: trashFixItems)
                .onAppear {
                    let logViewModel = LogViewModel()
                    logViewModel.fetchTrashFixItems { items in
                        trashFixItems = items
                    }
                }
                .tabItem {
                    Label("Log", systemImage: "doc.plaintext")
                }
            ProfileView()
                .tabItem() {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
