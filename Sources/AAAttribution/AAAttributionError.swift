//
//  AAAttributionError.swift
//
//
//  Created by Andrew Farquharson on 13/11/23.
//

import Vapor

public enum AAAttributionError: Error {
    case unknown(Int)
    case invalidToken
    case notFound
    case server
    case abort(Abort)

    public init?(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .invalidToken
        case 404:
            self = .notFound
        case 500:
            self = .server
        default:
            self = .unknown(statusCode)
        }
    }

    public var errorDescription: String? {
        switch self {
        case .unknown(let code):
            return "Unknown error code: \(code)"
        case .invalidToken:
            return "Invalid Token"
        case .notFound:
            return "Not found. The API is unable to retrieve the requested attribution record. - Retry"
        case .server:
            return "Apple Search Ads server is temporarily down or unreachable. - Retry"
        case .abort(let abort):
            return abort.errorDescription
        }
    }
}
