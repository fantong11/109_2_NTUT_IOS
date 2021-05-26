//
//  ToDo.swift
//  ToDoApp
//
//  Created by 范桶 on 2021/5/26.
//

import Foundation
import FirebaseFirestoreSwift

struct ToDo: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let isFinish: String
    let expireTime: String
}
