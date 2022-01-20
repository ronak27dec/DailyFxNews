//
//  NewsListTask.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

typealias NewsListResponse = (Result<News?, Error>) -> Void

struct NewsListTask {

    private var service: Serviceable
    private let urlString = "https://content.dailyfx.com/api/v1/dashboard"

    init(with service: Serviceable) {
        self.service = service
    }

    var request: URLRequest? {
        guard let unwrappedURL = URL(string: urlString) else { return nil }
        var request = URLRequest(url: unwrappedURL)
        request.httpMethod =  "GET"
        request.allowsCellularAccess = true
        return request
    }

    func parse(data: Data) -> News? {
        let parser = Parser(with: data)

        do {
            let parsedModel: News? = try parser.parse(for: News.self)
            return parsedModel
        } catch(let ex) {
            print("Parsing error: \(ex)")
            return nil
        }
    }

    func fetchFxNews(onCompletion: @escaping NewsListResponse) {
        guard let unwrappedRequest = request else {return}
        service.dispatch(with: unwrappedRequest) { result in

            switch result {
                case .success(let newsData):
                    handleResponseForSuccess(data: newsData,
                                             onCompletion: onCompletion)
                case .failure(let error):
                    handleResponseForFailure(error: error,
                                             onCompletion: onCompletion)
            }
        }
    }

    private func handleResponseForSuccess(data: Data,
                                          onCompletion: NewsListResponse) {
        let parsedModel = parse(data: data)
        onCompletion(.success(parsedModel))
    }

    private func handleResponseForFailure(error: NetworkError,
                                          onCompletion: NewsListResponse) {
        onCompletion(.failure(error))
    }
}
