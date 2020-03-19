//
//  Location.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation

/**
Data structure representing response service: LocationResponse
*/
struct LocationResponse: Codable {
    var info: Info
    var results: [Location]
}

struct Location: Codable {
    var id: Int?
    var name: String
    var type: String?
    var dimension: String?
    var residents: [String]?
    var url: String
    var created: String?
}
