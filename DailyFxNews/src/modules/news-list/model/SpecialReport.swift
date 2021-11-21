//
//  SpecialReport.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

struct SpecialReport: Decodable {
    var title: String?
    var url: String?
    var description: String?
    var content: String?
    var firstImageUrl: String?
    var headlineImageUrl: String?
    var articleImageUrl: String?
    var backgroundImageUrl: String?
    var videoType: String?
    var videoId: String?
    var videoUrl: String?
    var videoThumbnail: String?
    var newsKeywords: String?
    var authors: [Author]?
    var instruments: [String]?
    var tags: [String]?
    var categories: [String]?
    var displayTimestamp: Int?
    var lastUpdatedTimestamp: Int?
}
