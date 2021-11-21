//
//  NewsListTask.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

struct NewsListTask {

    private var service: Serviceable
    private var urlString: String

    init(with service: Serviceable, urlString: String) {
        self.service = service
        self.urlString = urlString
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
        }
        catch(let ex) {
            print("Parsing error: \(ex)")
            return nil
        }
    }

    func fetchFxNews() {
        guard let unwrappedRequest = request else {return}
        service.dispatch(with: unwrappedRequest) { result in

            switch result {
                case .success(let newsData): handleResponseForSuccess(data: newsData)
                case .failure(let error): handleResponseForFailure(error: error)
            }

        }
    }

    private func handleResponseForSuccess(data: Data) {
        let parser = parse(data: data)
    }

    private func handleResponseForFailure(error: NetworkError) {

    }
}
