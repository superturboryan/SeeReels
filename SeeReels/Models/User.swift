//
//  User.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import Foundation

struct User: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let profilePictureURL: String // TODO: Make this a URL, add Coding logic
    
    let stories: [Story] = []
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePictureURL = "profile_picture_url"
    }
}

extension [User] {
    static func randomSample(_ size: Int) -> [User] {
        Array([
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Neo",
                profilePictureURL: "https://i.pravatar.cc/300?u=1"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Trinity",
                profilePictureURL: "https://i.pravatar.cc/300?u=2"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Morpheus",
                profilePictureURL: "https://i.pravatar.cc/300?u=3"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Smith",
                profilePictureURL: "https://i.pravatar.cc/300?u=4"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Oracle",
                profilePictureURL: "https://i.pravatar.cc/300?u=5"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Cypher",
                profilePictureURL: "https://i.pravatar.cc/300?u=6"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Niobe",
                profilePictureURL: "https://i.pravatar.cc/300?u=7"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Dozer",
                profilePictureURL: "https://i.pravatar.cc/300?u=8"
            ),
            User(
                id:Int.random(in: 1..<Int.max),
                name: "Switch",
                profilePictureURL: "https://i.pravatar.cc/300?u=9"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Tank",
                profilePictureURL: "https://i.pravatar.cc/300?u=10"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Seraph",
                profilePictureURL: "https://i.pravatar.cc/300?u=11"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Sati",
                profilePictureURL: "https://i.pravatar.cc/300?u=12"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Merovingian",
                profilePictureURL: "https://i.pravatar.cc/300?u=13"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Persephone",
                profilePictureURL: "https://i.pravatar.cc/300?u=14"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Ghost",
                profilePictureURL: "https://i.pravatar.cc/300?u=15"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Lock",
                profilePictureURL: "https://i.pravatar.cc/300?u=16"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Rama",
                profilePictureURL: "https://i.pravatar.cc/300?u=17"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Bane",
                profilePictureURL: "https://i.pravatar.cc/300?u=18"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "The Keymaker",
                profilePictureURL: "https://i.pravatar.cc/300?u=19"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Commander Thadeus",
                profilePictureURL: "https://i.pravatar.cc/300?u=20"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Kid",
                profilePictureURL: "https://i.pravatar.cc/300?u=21"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Zee",
                profilePictureURL: "https://i.pravatar.cc/300?u=22"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Mifune",
                profilePictureURL: "https://i.pravatar.cc/300?u=23"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Roland",
                profilePictureURL: "https://i.pravatar.cc/300?u=24"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Cas",
                profilePictureURL: "https://i.pravatar.cc/300?u=25"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Colt",
                profilePictureURL: "https://i.pravatar.cc/300?u=26"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Vector",
                profilePictureURL: "https://i.pravatar.cc/300?u=27"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Sequoia",
                profilePictureURL: "https://i.pravatar.cc/300?u=28"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Sentinel",
                profilePictureURL: "https://i.pravatar.cc/300?u=29"
            ),
            User(
                id: Int.random(in: 1..<Int.max),
                name: "Turing",
                profilePictureURL: "https://i.pravatar.cc/300?u=30"
            ),
        ]
            .shuffled()
            .prefix(size)
        )
    }
}
