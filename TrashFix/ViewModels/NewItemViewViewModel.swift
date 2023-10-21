//
//  NewItemViewViewModel.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import FirebaseAuth
import FirebaseFirestore//AKA our database
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var trashFixID = ""
    @Published var showAlert = false
    
    init () {}
    
    func save () {
        guard canSave else {
            return
        }
        
        //Get Current User ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create a Model
        let newId = UUID().uuidString
        let newItem = TrashFixItem(
            id: newId,
            title: title,
            trashFixID: trashFixID,
            isDone: false
        )
        
        //Save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())//Our Dictionary
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
    
        return true
    }
}
