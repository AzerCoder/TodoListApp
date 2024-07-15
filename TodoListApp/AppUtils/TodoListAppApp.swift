//
//  TodoListAppApp.swift
//  TodoListApp
//
//  Created by A'zamjon Abdumuxtorov on 10/07/24.
//

import SwiftUI

@main
struct TodoListAppApp: App {
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
