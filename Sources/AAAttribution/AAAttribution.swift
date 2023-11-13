//
//  WallMonitorServerCore.swift
//
//
//  Created by Andrew Farquharson on 4/11/23.
//

import Vapor

public enum AAAttribution {

    // MARK: - Properties

    private static let apiURI: URI = URI(string: "https://api-adservices.apple.com/api/v1/")

    // MARK: - API

    public static func fetchRecord(_ token: String, client: Client) async throws -> AAAttributionRecord {
        var headers: HTTPHeaders = .init()
        headers.add(name: .contentType, value: "text/plain")
        headers.add(name: .accept, value: "application/json")

        do {
            let response = try await client.post(apiURI) { req in
                try req.content.encode(token)
                req.headers = headers
            }
            if let errorCode: AAAttributionError = .init(statusCode: Int(response.status.code)) {
                throw errorCode
            }

            let decoder = JSONDecoder()
            let dateFormatter: DateFormatter = .init()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)

            return try response.content.decode(AAAttributionRecord.self, using: decoder)
        } catch {
            if let error = error as? Abort {
                throw AAAttributionError.abort(error)
            } else if let error = error as? AAAttributionError {
                throw error
            } else {
                throw error
            }
        }
    }
}
