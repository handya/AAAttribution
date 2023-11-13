//
//  AAAttributionResponse.swift
//
//
//  Created by Andrew Farquharson on 13/11/23.
//

import Foundation

public struct AAAttributionRecord: Codable {
    public let attribution: Bool
    public let orgId: Int?
    public let campaignId: Int?
    public let conversionType: ConversionType?
    public let clickDate: Date?
    public let adGroupId: Int?
    public let countryOrRegion: String?
    public let keywordId: Int?
    public let adId: Int?
}
