//
//  Films.swift
//  LearningTask-11.2
//
//  Created by Laura Pinheiro Marson on 06/12/22.
//

import Foundation

struct Films: Decodable {
    let results: [Film]
}

struct Film: Decodable {
    let title: String
    let episodeId: Int
    let director: String
    let producer: String
    let releaseDate: Date
    let starships: [String]
    
    enum CodingKeys: String, CodingKey {
        case title, director, producer, starships
        case episodeId = "episode_id"
        case releaseDate = "release_date"
    }
}

extension Film {
    var starshipsURL: [URL] {
        starships.map { urlString in
            URL(string: urlString)!
        }
    }
}
