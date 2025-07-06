//
//  App.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import SwiftUI

@main
struct SeeReelsApp: App {
    
    @StateObject var userStore = UserStore(service: MockUserService())
    
    var body: some Scene {
        WindowGroup {
            UserListView()
                .environmentObject(userStore)
        }
    }
}
