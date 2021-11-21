//
//  NetworkService.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

class NetworkService: Serviceable {

    func dispatch(with request: URLRequest,
                  onCompletion: @escaping (Result<Data, NetworkError>) -> Void) {

        session.dataTask(with: request) { responseData, urlResponse, error in
            if error == nil {
                guard let unwrappedData = responseData else {return}
                onCompletion(.success(unwrappedData))
            } else {
                onCompletion(.failure(NetworkError.apiError))
            }
        } .resume()
    }
}
