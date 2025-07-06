//
//  UserListView.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        NavigationStack {
            Group {
                if userStore.users.isEmpty {
                    loadingPlaceholder
                } else {
                    userList
                        .frame(maxWidth: .infinity)
                        .navigationTitle("SeeReels 👀🎞️")
                        .toolbar {
                            addReelButton
                        }
                }
            }
            .animation(.default, value: userStore.users)
        }
        .ignoresSafeArea()
        .task {
            await userStore.loadNextPageOfUsers()
        }
    }
    
    var userList: some View {
        List(userStore.users) {
            userRow($0)
        }
    }
    
    var loadingPlaceholder: some View {
        VStack {
            Label("Loading your friends' stories", systemImage: "person.3")
            ProgressView()
                .controlSize(.extraLarge)
                .tint(Color.pink.gradient)
        }
    }
    
    func userRow(_ user: User) -> some View {
        HStack(spacing: 20) {
            userImage(user.profilePictureURL)
            Text(user.name)
                .fontWeight(.medium)
            Spacer()
        }
        .listRowBackground(EmptyView())
        .listRowSeparator(.hidden)
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .frame(maxWidth: .infinity)
    }
    
    func userImage(_ url: String, size: CGFloat = 60) -> some View {
        AsyncImage(url: URL(string: url)!) {
            $0.image?
                .resizable()
                .scaledToFit()
        }
        .clipShape(Circle())
        .frame(width: size, height: size)
    }
    
    var addReelButton: some View {
        Button {
            print("TODO: Allow user to add own story")
        } label: {
            Image(systemName: "plus.circle.dashed")
                .fontWeight(.bold)
                .symbolRenderingMode(.palette)
                
        }
        .buttonStyle(.borderedProminent)
        .tint(Color.pink.gradient)
        .clipShape(Circle())
    }
}

#Preview {
    UserListView()
        .environmentObject(UserStore(
            users: [],
            service: MockUserService()
        ))
}
