//
//  cloneTodoAppApp.swift
//  cloneTodoApp
//
//  Created by MAYDAY on 2/11/24.
//

import SwiftUI

@main
struct cloneTodoApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ListView()
                AppleLoginView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
