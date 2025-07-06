//
//  Unit_Tests.swift
//  Unit Tests
//
//  Created by Ryan on 2025-07-06.
//

import Testing
@testable import SeeReels

struct UserStoreTests {
    
    @MainActor
    struct LoadNextPageOfUsers {
        
        @Test
        func loadNextPage_appendsNewUsers() async {
            let store = UserStore(users: [], service: MockUserService())
            
            #expect(store.users.isEmpty)
            
            await store.loadNextPageOfUsers()
            
            #expect(!store.users.isEmpty)
        }
        
        @Test(
        """
        Given the UserFetching service throws an error, \
        When loadNextPageOfUsers is called, \
        Then the UserStore publishes the error
        """
        )
        func error() async {
            let errorToThrow = UserFetchingError.mockError
            let failingMockService = MockUserService(errorToThrow: errorToThrow)
            let store = UserStore(service: failingMockService)
            
            await store.loadNextPageOfUsers()
            
            #expect(store.error as? UserFetchingError == errorToThrow)
        }
    }
}
