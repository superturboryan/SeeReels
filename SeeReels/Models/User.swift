//
//  User.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import Foundation

struct User: Identifiable, Codable {
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
    static var all: [User] {
        [
            User(
                id: 1,
                name: "Neo",
                profilePictureURL: "https://i.pravatar.cc/300?u=1"
            ),
            User(
                id: 2,
                name: "Trinity",
                profilePictureURL: "https://i.pravatar.cc/300?u=2"
            ),
            User(
                id: 3,
                name: "Morpheus",
                profilePictureURL: "https://i.pravatar.cc/300?u=3"
            ),
            User(
                id: 4,
                name: "Smith",
                profilePictureURL: "https://i.pravatar.cc/300?u=4"
            ),
            User(
                id: 5,
                name: "Oracle",
                profilePictureURL: "https://i.pravatar.cc/300?u=5"
            ),
            User(
                id: 6,
                name: "Cypher",
                profilePictureURL: "https://i.pravatar.cc/300?u=6"
            ),
            User(
                id: 7,
                name: "Niobe",
                profilePictureURL: "https://i.pravatar.cc/300?u=7"
            ),
            User(
                id: 8,
                name: "Dozer",
                profilePictureURL: "https://i.pravatar.cc/300?u=8"
            ),
            User(
                id: 9,
                name: "Switch",
                profilePictureURL: "https://i.pravatar.cc/300?u=9"
            ),
            User(
                id: 10,
                name: "Tank",
                profilePictureURL: "https://i.pravatar.cc/300?u=10"
            ),
            User(
                id: 11,
                name: "Seraph",
                profilePictureURL: "https://i.pravatar.cc/300?u=11"
            ),
            User(
                id: 12,
                name: "Sati",
                profilePictureURL: "https://i.pravatar.cc/300?u=12"
            ),
            User(
                id: 13,
                name: "Merovingian",
                profilePictureURL: "https://i.pravatar.cc/300?u=13"
            ),
            User(
                id: 14,
                name: "Persephone",
                profilePictureURL: "https://i.pravatar.cc/300?u=14"
            ),
            User(
                id: 15,
                name: "Ghost",
                profilePictureURL: "https://i.pravatar.cc/300?u=15"
            ),
            User(
                id: 16,
                name: "Lock",
                profilePictureURL: "https://i.pravatar.cc/300?u=16"
            ),
            User(
                id: 17,
                name: "Rama",
                profilePictureURL: "https://i.pravatar.cc/300?u=17"
            ),
            User(
                id: 18,
                name: "Bane",
                profilePictureURL: "https://i.pravatar.cc/300?u=18"
            ),
            User(
                id: 19,
                name: "The Keymaker",
                profilePictureURL: "https://i.pravatar.cc/300?u=19"
            ),
            User(
                id: 20,
                name: "Commander Thadeus",
                profilePictureURL: "https://i.pravatar.cc/300?u=20"
            ),
            User(
                id: 21,
                name: "Kid",
                profilePictureURL: "https://i.pravatar.cc/300?u=21"
            ),
            User(
                id: 22,
                name: "Zee",
                profilePictureURL: "https://i.pravatar.cc/300?u=22"
            ),
            User(
                id: 23,
                name: "Mifune",
                profilePictureURL: "https://i.pravatar.cc/300?u=23"
            ),
            User(
                id: 24,
                name: "Roland",
                profilePictureURL: "https://i.pravatar.cc/300?u=24"
            ),
            User(
                id: 25,
                name: "Cas",
                profilePictureURL: "https://i.pravatar.cc/300?u=25"
            ),
            User(
                id: 26,
                name: "Colt",
                profilePictureURL: "https://i.pravatar.cc/300?u=26"
            ),
            User(
                id: 27,
                name: "Vector",
                profilePictureURL: "https://i.pravatar.cc/300?u=27"
            ),
            User(
                id: 28,
                name: "Sequoia",
                profilePictureURL: "https://i.pravatar.cc/300?u=28"
            ),
            User(
                id: 29,
                name: "Sentinel",
                profilePictureURL: "https://i.pravatar.cc/300?u=29"
            ),
            User(
                id: 30,
                name: "Turing",
                profilePictureURL: "https://i.pravatar.cc/300?u=30"
            ),
        ]
    }
}
