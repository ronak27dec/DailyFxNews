//
//  Serviceable.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

protocol Serviceable: AnyObject {
    var session: URLSession { get }

    func dispatch(with request: URLRequest,
                  onCompletion: @escaping (Result<Data, NetworkError>) -> Void)
}

extension Serviceable {

    var session: URLSession {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }

}
