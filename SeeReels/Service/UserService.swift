//
//  UserService.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import Foundation

/// Describes a service that can fetch pages of users
protocol UserFetching {
    
    /// Fetches the next available page of users.
    /// - Returns: An array of users
    func fetchUserPage() async throws -> [User]
}

/// Mock service returning pages of users with configurable `delay` and `errorToThrow` properties.
///
/// - Parameters:
///   - delay: How long the call to return a page of users should take. Default = 2
///   - errorToThrow: Set this if you want the mock service to fail. Default = nil
final class MockUserService: UserFetching {
    
    var delay: Duration = .seconds(2)
    var errorToThrow: UserFetchingError?
    
    func fetchUserPage() async throws -> [User] {
        guard errorToThrow == nil else {
            throw errorToThrow!
        }
        
        let users = try await Task {
            try await Task.sleep(for: delay)
            return [User].randomSample(10)
        }.value
        
        return users
    }
}

enum UserFetchingError: LocalizedError {
    
    case mockError
    
    var errorDescription: String? {
        switch self {
        case .mockError: "Failed to load the list of users, please try again" // Could use recoveryDescription?
        }
    }
}
