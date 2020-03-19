//
//  NetworkManager.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation
import Moya
import Alamofire

/**
Structure with service configuration and implementation: Character
*/
struct NetworkManager: Networkable {

    var provider = MoyaProvider<RickAndMortyAPI>()

/**
Structure with service configuration and implementation: Character
     - parameters:
        - name: episode name
        - page: number page
        - completion: Alias
*/
    public func getCharacter(name: String, page: String, completion: @escaping CharacterInfoAlias) {
        provider.request(.character(name: name, page: page), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(CharacterResponse.self, from: response.data)
                    completion(results.results, results.info)
                }
                catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                if let reachabilityManger = NetworkReachabilityManager() {
                    if !reachabilityManger.isReachable {
                        print("offline")
                    }
                }
                print(error.localizedDescription)
            }
        })
    }

/**
Structure with service configuration and implementation: CharacterWith
     - parameters:
        - ids: id character
        - completion: Alias
*/

    public func getCharactersWith(ids: String, completion: @escaping CharacterAlias) {
        provider.request(.charactersWith(ids: ids), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([Character].self, from: response.data)
                    completion(results)
                }
                catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):

                if let reachabilityManger = NetworkReachabilityManager(){
                    if !reachabilityManger.isReachable {
                        print("offline")
                    }
                }

                print(error.localizedDescription)
            }
        })
    }

/**
Structure with service configuration and implementation: Location
     - parameters:
        - name: episode name
        - page: number page
        - completion: Alias
*/
    public func getLocation(name: String, page: String, completion: @escaping LocationAlias) {
        provider.request(.location(name: name, page: page), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(LocationResponse.self, from: response.data)
                    completion(results.results, results.info)
                }
                catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                if let reachabilityManger = NetworkReachabilityManager(){
                    if !reachabilityManger.isReachable {
                        print("offline")
                    }
                }
                print(error.localizedDescription)
            }
        })
    }

    
/**
Structure with service configuration and implementation: Episode
     - parameters:
        - name: episode name
        - page: number page
        - completion: Alias
*/
    public func getEpisode(name: String, page: String, completion: @escaping EpisodeAlias) {
        provider.request(.episode(name: name, page: page), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(EpisodeResponse.self, from: response.data)
                    completion(results.results, results.info)
                }
                catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                if let reachabilityManger = NetworkReachabilityManager(){
                    if !reachabilityManger.isReachable {
                        print("offline")
                    }
                }
                print(error.localizedDescription)
            }
        })
    }
}
