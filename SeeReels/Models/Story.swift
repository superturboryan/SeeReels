//
//  Story.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//

import SwiftUI

struct Story: Identifiable, Codable, Equatable {
    var id = UUID()
    var seen = false
    var caption: String = .randomCaption
}

private extension String {
    static var randomCaption: String {
        let captions = [
            String(localized: "just vibin’ in my own era ✨ #bigmood"),
            String(localized: "low key living my best life rn 🤙"),
            String(localized: "it’s giving carefree summer days ☀️💦"),
            String(localized: "caught a vibe, staying on it 🚀 #nojoke"),
            String(localized: "mood: main character energy 🎬"),
            String(localized: "when the beat drops and so do my worries 🎶🕺"),
            String(localized: "sorry i’m busy being iconic 🔥 #sorrynotsorry"),
            String(localized: "no cap, this view is everything 🏞️"),
            String(localized: "making memories one clip at a time 📸💖"),
            String(localized: "just a girl/guy and her/his coffee ☕️✨ #amvibes"),
        ]
        return captions.randomElement()!
    }
}
