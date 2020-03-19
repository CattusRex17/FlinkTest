//
//  Episode.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation

/**
Data structure representing response service: EpisodeResponse
*/
struct EpisodeResponse: Codable {
    var info: Info
    var results: [Episode]
}

struct Episode: Codable {
    var id: Int
    var name: String
    var airDate: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String

    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }

    func characterIds() -> String {
        var ids = ""
        for characterUrl in characters {
            if let index = characterUrl.range(of: "character/")?.upperBound {
                let characterIdSubString = (characterUrl[index...])
                let characterId = String(characterIdSubString)
                ids.append(characterId + ",")
            }
        }
        return ids
    }
}
