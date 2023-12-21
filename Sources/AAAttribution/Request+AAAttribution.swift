//
//  Request+AAAttribution.swift
//
//
//  Created by Andrew Farquharson on 22/12/23.
//

import Vapor

extension Request {
    public var attribution: Attribution {
        .init(request: self)
    }

    public struct Attribution {
        let request: Request
    }
}

extension Request.Attribution {
    public var logger: Logger? {
        self.request.logger
    }

    public var client: Client {
        self.request.client
    }

    public func fetchRecord(_ token: String) async throws -> AAAttributionRecord {
        return try await AAAttribution.fetchRecord(token, client: client)
    }
}
