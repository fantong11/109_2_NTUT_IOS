//
//  ToDoViewModel.swift
//  ToDoApp
//
//  Created by 范桶 on 2021/5/26.
//

import Foundation
import FirebaseFirestore

class ToDoViewModel: ObservableObject {
    let db = Firestore.firestore()
    @Published var name: String = ""
    @Published var isFinish: String = ""
    @Published var expireTime: String = ""
    @Published var fetchName: String = ""
    @Published var fetchIsFinish: String = ""
    @Published var fetchExpireTime: String = ""
    @Published var time: Date = Date()
    var id: String = ""
    
    init() {
        //
    }
    
    func createToDo() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        
        let toDo = ToDo(name: name, isFinish: isFinish, expireTime: dateFormatter.string(from: time))
        do {
            let documentReference = try db.collection("ToDoApp").addDocument(from: toDo)
            print(documentReference.documentID)
            id = documentReference.documentID
        } catch {
            print(error)
        }
    }
    
    func fetchToDoById() {
        if id == "" { return }
        db.collection("ToDoApp").document(id).getDocument { document, error in
            guard let document = document, document.exists, let toD = try? document.data(as: ToDo.self) else { return }
            self.fetchName = toD.name
            self.fetchIsFinish = toD.isFinish
            self.fetchExpireTime = toD.expireTime
        }
    }
}
