//
//  UserStore.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import Foundation
import OSLog

/// An observable store responsible for loading and publishing pages of `User` objects.
///
/// Conforms to `ObservableObject` and uses Swift’s async/await to fetch data from a
/// provided `UserFetching` service. Automatically loads the first page upon initialization
/// and exposes published properties for the loaded users and any loading errors.
///
/// - Note: All operations occur on the `MainActor`.
@MainActor
final class UserStore: ObservableObject {
    
    /// All the users loaded so far.
    @Published var users: [User] = []
    
    /// The most recent error that occurred during a page load, if any.
    @Published var error: Swift.Error?
    
    /// The service used to fetch user pages.
    private var service: UserFetching
    
    // TODO: Helper to access bundle ID from info.plist
    private let log = Logger(subsystem: "com.SuperTurboRyan.SeeReels", category: "\(UserStore.self)")
    
    init(
        users: [User] = [],
        service: UserFetching
    ) {
        self.users = users
        self.service = service
        Task {
            await loadNextPageOfUsers()
        }
    }
    
    func loadNextPageOfUsers() async {
        do {
            self.users += try await service.fetchUserPage()
            log("Loaded page of users: \(self.users)")
        } catch {
            log("Error loading next page of users: \(error)", isError: true)
            self.error = error
        }
    }
    
    // TODO: Put this into a Logging protocol
    func log(_ message: String, isError: Bool = false) {
        isError ?
        log.error("\(message, privacy: .public)") :
        log.info("\(message, privacy: .public)")
    }
}
