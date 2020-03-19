//
//  Environment.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation

public enum PlistKey {
    /**
    Get data from Info.plis to implementation Scheme URL
    */
    case BaseUrl
    /**
    Get data from Info.plis to implementation App Id
    */
    case AppId

    func value() -> String {
        switch self {
        case .BaseUrl:
            return "BaseUrl"
        case .AppId:
            return "AppId"
        }
    }
}

/**
 Implementation and configuration of differents schemes
 */

public struct Environment {
    fileprivate var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }
    public func configuration(_ key: PlistKey) -> String {

        guard let pkey = infoDict[key.value()] else {
            return ""
        }
        return (pkey as! String).replacingOccurrences(of: "\\", with: "")
    }
}
