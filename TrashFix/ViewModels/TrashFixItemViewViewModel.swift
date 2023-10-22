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
import FirebaseDatabase

class TrashFixItemViewViewModel: ObservableObject {
    init() {}

    func observeStatus(item: TrashFixItem) {
            let ref = Database.database().reference().child("Status")

            ref.observe(DataEventType.value) { snapshot in
                if let value = snapshot.value as? String {
                    
                    var itemCopy = item
                    
                    guard let uid = Auth.auth().currentUser?.uid else {
                        return
                    }
                    
                    if value == "Full" {
                        itemCopy.setDone(true)
                    } else {
                        itemCopy.setDone(false)
                    }
                    
                    let db = Firestore.firestore()
                    db.collection("users")
                        .document(uid)
                        .collection("todos")
                        .document(itemCopy.id)
                        .setData(itemCopy.asDictionary(), merge: true)
                }
            }
        }
    
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
