//
//  TrashFixViewViewModel.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

//View Model for TrashFixItem

import FirebaseFirestore
import Foundation

class TrashFixViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    // Delete Trash Fix Item
    // - Parameter id: Item is to Delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
