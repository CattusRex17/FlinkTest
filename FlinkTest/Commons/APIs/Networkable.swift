//
//  Networkable.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation
import Moya

// Alias used in service imlpementation
typealias LocationAlias = ([Location], Info) -> Void
typealias CharacterAlias = ([Character]) -> Void
typealias CharacterInfoAlias = ([Character], Info) -> Void
typealias EpisodeAlias = ([Episode], Info) -> Void

// Protocol used for implementation services with Moya
protocol Networkable {
    var provider: MoyaProvider<RickAndMortyAPI> { get }
    func getCharacter(name: String, page: String, completion: @escaping CharacterInfoAlias)
    func getCharactersWith(ids: String, completion: @escaping CharacterAlias)
    func getLocation(name: String, page: String, completion: @escaping LocationAlias)
    func getEpisode(name: String, page: String, completion: @escaping EpisodeAlias)
}
