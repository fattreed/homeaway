//
//  API.swift
//  HomeAwayUIKit
//
//  Created by matty on 3/7/20.
//  Copyright © 2020 matty. All rights reserved.
//

import Foundation

enum API {
    typealias Completion = ([Event]) -> ()
    static func search(with query: String, completion: @escaping Completion) {
        let url = URL(string: "https://api.seatgeek.com/2/events?client_id=NDA3NTEzNnwxNTgzNjAyODAxLjk2&q=\(query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion([])
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(DateFormatter.decoderFormatter)
            let result = try! decoder.decode(Result.self, from: data)
            completion(result.events)
        }.resume()
    }
}
