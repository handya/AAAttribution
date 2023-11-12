//
//  AAAttributionError.swift
//
//
//  Created by Andrew Farquharson on 13/11/23.
//

import Vapor

public enum AAAttributionError: Error {
    case unknown
    case invalidToken
    case retry
    case server
    case abort(Abort)

    public init?(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .invalidToken
        case 404:
            self = .retry
        case 500:
            self = .server
        default:
            return nil
        }
    }
}
