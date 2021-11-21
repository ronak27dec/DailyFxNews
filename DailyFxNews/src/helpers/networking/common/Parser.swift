//
//  Parser.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

class Parser {

    private var data: Data

    init(with data: Data) {
        self.data = data
    }

    func parse<T: Decodable>(for type: T.Type) throws -> T? {
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.self, from: data)
            return model
        } catch(let ex) {
            print("ERROR: Parsing Exception - \(ex)")
            throw NetworkError.parsingError
        }
    }
}
