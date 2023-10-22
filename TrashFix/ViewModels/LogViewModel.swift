//
//  LogViewModel.swift
//  TrashFix
//
//  Created by Isaac Salzman on 10/22/23.
//

import Foundation
import Firebase

class LogViewModel: ObservableObject {
    private let db = Firestore.firestore()
    
    func fetchTrashFixItems(completion: @escaping ([TrashFixItem]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion([])
            return
        }
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                    completion([])
                    return
                }
                
                var trashFixItems: [TrashFixItem] = []
                
                for document in documents {
                    if let data = document.data() as? [String: Any],
                       let id = data["id"] as? String,
                       let title = data["title"] as? String,
                       let trashFixID = data["trashFixID"] as? String,
                       let isDone = data["isDone"] as? Bool {
                        let filledDate = (data["filledDate"] as? Timestamp)?.dateValue()
                        let unfilledDate = (data["unfilledDate"] as? Timestamp)?.dateValue()
                        
                        let trashFixItem = TrashFixItem(id: id, title: title, trashFixID: trashFixID, isDone: isDone, filledDate: filledDate, unfilledDate: unfilledDate)
                        trashFixItems.append(trashFixItem)
                    }
                }
                
                completion(trashFixItems)
            }
    }
}
