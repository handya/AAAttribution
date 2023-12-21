//
//  AAAttributionRecord+TestData.swift
//
//
//  Created by Andrew Farquharson on 14/11/23.
//

import Foundation

public extension AAAttributionRecord {
    var isTestRecord: Bool {
        return attribution == Self.testRecord.attribution
        && orgId == Self.testRecord.orgId
        && campaignId == Self.testRecord.campaignId
        && adGroupId == Self.testRecord.adGroupId
        && keywordId == Self.testRecord.keywordId
        && adId == Self.testRecord.adId
    }

    private static let testRecord: AAAttributionRecord = .init(attribution: true,
                                                               orgId: 1234567890,
                                                               campaignId: 1234567890,
                                                               conversionType: .download,
                                                               clickDate: nil,
                                                               adGroupId: 1234567890,
                                                               countryOrRegion: "US",
                                                               keywordId: 12323222,
                                                               adId: 1234567890)
}
