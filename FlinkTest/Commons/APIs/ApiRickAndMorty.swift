//
//  ApiRickAndMorty.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum RickAndMortyAPI {
    /**
    Communication interface for Character  Service
    */
    case character(name: String, page: String)
    /**
    Communication interface for CharacterWith  Service
    */
    case charactersWith(ids: String)
    /**
    Communication interface for Location Service
    */
    case location(name: String, page: String)
    /**
    Communication interface for Episode Services
    */
    case episode(name: String, page: String)
}

extension RickAndMortyAPI: TargetType {
    var baseURL: URL {
        return URL( string: Environment().configuration(PlistKey.BaseUrl))!
    }
    var path: String {
        switch self {
        case .character:
            return "character"
        case .charactersWith(let ids):
            return "character/\(ids)"
        case .location:
            return "location"
        case .episode:
            return "episode"
        }
    }
    var method: Moya.Method {
        return .get
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }

    var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    var task: Task {
        switch self {
        case .character(let name, let page):
            return .requestParameters(parameters: ["name": name, "page": page], encoding: self.encoding)
        case .charactersWith(_):
            return .requestParameters(parameters: [:], encoding: self.encoding)
        case .location(let name, let page):
            return .requestParameters(parameters: ["name": name, "page": page], encoding: self.encoding)
        case .episode(let name, let page):
            return .requestParameters(parameters: ["name": name, "page": page], encoding: self.encoding)
        }
    }
}
