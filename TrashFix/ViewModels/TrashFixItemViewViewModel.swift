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
    @Published var isTrashCanFull = false

        init() {
            observeStatus()
        }

        func observeStatus() {
            let ref = Database.database(url: "https://trashfix-e3b6f-default-rtdb.firebaseio.com/").reference().child("Status")

            ref.observe(DataEventType.value) { snapshot in
                if let value = snapshot.value as? String {
                    if value == "Full" {
                        self.isTrashCanFull = true
                    } else {
                        self.isTrashCanFull = false
                    }
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
