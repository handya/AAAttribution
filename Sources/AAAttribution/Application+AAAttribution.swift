//
//  Application+AAAttribution.swift
//
//
//  Created by Andrew Farquharson on 22/12/23.
//

import Vapor

extension Application {
    public var attribution: Attribution {
        .init(application: self)
    }

    public struct Attribution {
        let application: Application
    }
}

extension Application.Attribution {
    public var logger: Logger? {
        self.application.logger
    }

    public var client: Client {
        self.application.client
    }

    public func fetchRecord(_ token: String) async throws -> AAAttributionRecord {
        return try await AAAttribution.fetchRecord(token, client: client)
    }
}
