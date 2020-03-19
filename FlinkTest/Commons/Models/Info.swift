//
//  Page.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import Foundation
/**
Data structure representing pagination data
*/

struct Info: Codable {
    var count: Int
    var pages: Int
    var next: String
    var prev: String

    func nextPage() -> String {
        return trimPageURL(next)
    }

    func previousPage() -> String {
        return trimPageURL(prev)
    }

    func currentPage() -> String {
        if nextPage() != "" {
            if let nextPageInt = Int(nextPage()) {
                return "\(nextPageInt - 1)"
            }
        } else if previousPage() != "" {
            if let previousPageInt = Int(previousPage()) {
                return "\(previousPageInt + 1)"
            }
        }
        return "1"
    }

    private func trimPageURL(_ urlString: String) -> String {
        if let index = urlString.range(of: "=")?.upperBound {
            let pageSubString = (urlString[index...])
            let pageNum = String(pageSubString)
            return pageNum
        }
        return ""
    }
}
