//
//  News.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

struct News: Decodable {
    var breakingNews: String?
    var topNews: [TopNews] = []
    var dailyBriefings: DailyBriefings?
    var technicalAnalysis: [TechnicalAnalysis] = []
    var specialReport: [SpecialReport] = []
}
