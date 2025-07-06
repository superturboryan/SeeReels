//
//  UserListView.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import OSLog
import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var userStore: UserStore
    
    @State var loadingNextPage = false
    @State var searchText = ""
    
    let log = Logger(subsystem: "com.SuperTurboRyan.SeeReels", category: "\(UserListView.self)")
    
    var body: some View {
        NavigationStack {
            ZStack {
                if userStore.users.isEmpty {
                    loadingPlaceholder
                } else {
                    userList
                        .frame(maxWidth: .infinity)
                        .navigationTitle("SeeReels 👀🎞️")
                        .toolbar {
                            addReelButton
                        }
                        .searchable(text: $searchText)
                }
            }
            .animation(.default, value: userStore.users)
        }
        .ignoresSafeArea()
        .task { await userStore.loadNextPageOfUsers() }
        .alert("Uh oh! 🫨", isPresented: errorAlertBinding) {
            Button("Got it 🙂‍↕️") {
                Task { await userStore.loadNextPageOfUsers() }
            }
        } message: {
            Text(userStore.error?.localizedDescription ?? "")
        }
        
    }
    
    var errorAlertBinding: Binding<Bool> {
        Binding(
            get: {
                userStore.error != nil
            }) { isPresented in
                if !isPresented {
                    userStore.error = nil
                }
            }
    }
    
    @ViewBuilder
    var userList: some View {
        let filteredUsers = userStore.users.filter {
            guard !searchText.isEmpty else {
                return true
            }
            return $0.name.contains(searchText)
        }
        
        VStack {
            List {
                ForEach(filteredUsers) { user in
                    userRow(user)
                        .task {
                            if shouldLoadMoreUsers(givenUserWithIdIsSeen: user.id) {
                                loadingNextPage = true
                                defer { loadingNextPage = false }
                                await userStore.loadNextPageOfUsers()
                            }
                        }
                }
                if loadingNextPage {
                    HStack {
                        Spacer()
                        Text("Loading more users...")
                            .onAppear {
                                log("Loading next page of users")
                            }
                        Spacer()
                    }
                    .listRowBackground(EmptyView())
                }
            }
            .animation(.default, value: userStore.users)
        }
    }
    
    func shouldLoadMoreUsers(givenUserWithIdIsSeen id: Int, andRemainingUsersToView threshold: Int = 5) -> Bool {
        let totalLoadedUsers = userStore.users.count
        let thresholdUserId = userStore.users[totalLoadedUsers - threshold].id
        return id == thresholdUserId
    }
    
    func userRow(_ user: User) -> some View {
        Button {
            log("TODO: Present user stories using VerticalPagingScrollView")
        } label: {
            HStack(spacing: 20) {
                userImage(user)
                Text(user.name)
                    .fontWeight(.medium)
                Spacer()
            }
            .padding()
            .background(Color.systemBackground)
        }
        .buttonStyle(.plain) // TODO: Pressed state
        .listRowBackground(EmptyView())
        .listRowSeparator(.hidden)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .frame(maxWidth: .infinity)
    }
    
    func userImage(_ user: User, size: CGFloat = 60) -> some View {
        AsyncImage(url: URL(string: user.profilePictureURL)!) { image in
            ZStack {
                if let unwrapped = image.image {
                    unwrapped
                        .resizable()
                        .scaledToFit()
                } else {
                    styledProgressView
                }
            }
            .animation(.default, value: image.image)
        }
        .clipShape(Circle())
        .overlay {
            Circle()
                .strokeBorder(
                    AngularGradient.igStyle.opacity(user.allStoriesSeen ? 0.3 : 1.0),
                    lineWidth: 4
                )
        }
        .frame(width: size, height: size)
    }
    
    var loadingPlaceholder: some View {
        VStack {
            Label("Loading your friends' stories", systemImage: "person.3")
            styledProgressView
                .controlSize(.extraLarge)
        }
    }
    
    var styledProgressView: some View {
        ProgressView()
            .tint(Color.pink.gradient)
    }
    
    var addReelButton: some View {
        Button {
            log("TODO: Allow user to add own story")
        } label: {
            Image(systemName: "plus.circle.dashed")
                .fontWeight(.bold)
                .symbolRenderingMode(.palette)
            
        }
        .buttonStyle(.borderedProminent)
        .tint(Color.pink.gradient)
        .clipShape(Circle())
    }
    
    func log(_ message: String, isError: Bool = false) {
        isError ?
        log.error("\(message, privacy: .public)") :
        log.info("\(message, privacy: .public)")
    }
}

#Preview {
    let errorToThrow: UserFetchingError? = nil // .mockError
    UserListView()
        .environmentObject(UserStore(
            users: [],
            service: MockUserService(errorToThrow: errorToThrow)
        ))
}
