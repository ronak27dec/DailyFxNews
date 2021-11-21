//
//  Author.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

struct Author: Decodable {
    var name: String?
    var title: String?
    var bio: String?
    var email: String?
    var phone: String?
    var facebook: String?
    var twitter: String?
    var googleplus: String?
    var subscription: String?
    var rss: String?
    var descriptionLong: String?
    var descriptionShort: String?
    var photo: String?
}
