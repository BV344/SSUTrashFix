//
//  TrashFixItemsView.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TrashFixView: View {
    @StateObject var viewModel: TrashFixViewViewModel
    @FirestoreQuery var items: [TrashFixItem]
    

    
    init(userId: String) {
      
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: TrashFixViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TrashFixItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Your Trash Can")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            }
        }
    }
}

struct TrashFixView_Previews: PreviewProvider {
    static var previews: some View {
        TrashFixView(userId: "6D1dEhmryNg2FOkDMN1jeg60ZKg1")
    }
}
