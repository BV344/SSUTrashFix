//
//  TrashFixItemViewViewModel.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

//View Model for TrashFixItem
import FirebaseAuth
import FirebaseFirestore
import Foundation

class TrashFixItemViewViewModel: ObservableObject {
    init () {}
    
    func toggleIsDone(item: TrashFixItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary(), merge: true)
    }
}
