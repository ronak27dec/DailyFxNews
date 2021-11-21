//
//  DailyBriefings.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

struct DailyBriefings: Decodable {
    var eu: [Eu]?
    var asia: [Asia]?
    var usa: [Us]?
}
