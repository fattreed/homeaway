//
//  HomeAway+DateFormatter.swift
//  HomeAwayUIKit
//
//  Created by matty on 3/7/20.
//  Copyright © 2020 matty. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let decoderFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    static let displayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy h:mm a"
        return formatter
    }()
}
