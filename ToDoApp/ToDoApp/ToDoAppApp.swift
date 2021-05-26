//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by 范桶 on 2021/5/26.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
