//
//  UserStore.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import Foundation
import OSLog

@MainActor
final class UserStore: ObservableObject {
    
    @Published var users: [User] = []
    @Published var error: Swift.Error?
    
    // TODO: Helper to access bundle ID from info.plist
    private let log = Logger(subsystem: "com.SuperTurboRyan.SeeReels", category: "\(UserStore.self)")
    private var service: UserFetching
    
    init(
        users: [User] = [],
        service: UserFetching
    ) {
        self.users = users
        self.service = service
        Task {
            try? await loadNextPageOfUsers()
        }
    }
    
    func loadNextPageOfUsers() async throws {
        do {
            self.users += try await service.fetchUserPage()
            log("Loaded page of users: \(self.users)")
        } catch {
            log("Error loading next page of users: \(error)", isError: true)
            throw error
        }
    }
    
    func log(_ message: String, isError: Bool = false) {
        isError ?
        log.error("\(message, privacy: .public)") :
        log.info("\(message, privacy: .public)")
    }
}
