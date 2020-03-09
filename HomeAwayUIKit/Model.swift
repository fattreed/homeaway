//
//  Model.swift
//  HomeAwayUIKit
//
//  Created by matty on 3/7/20.
//  Copyright © 2020 matty. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let events: [Event]
}

struct Event: Decodable {
    let title: String?
    let datetimeLocal: Date?
    let venue: Venue?
    let performers: [Performer]
}

struct Venue: Decodable {
    let city: String?
    let state: String?
}

struct Performer: Decodable {
    let image: URL?
}
