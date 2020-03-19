//
//  Character.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation

/**
Data structure representing response service: CharacterResponse
*/
struct CharacterResponse: Codable {
    var info: Info
    var results: [Character]
}

/**
Data structure representing response service: CharacterResponse
*/
struct CharacterLocation: Codable {
    var name: String
    var url: String
}

struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Location
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}
