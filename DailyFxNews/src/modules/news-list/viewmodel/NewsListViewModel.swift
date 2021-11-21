//
//  NewsListViewModel.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

class NewsListViewModel: NSObject {

    private let newsURLString = "https://content.dailyfx.com/api/v1/dashboard"
    private(set) var news: News? { didSet { bind() }}
    private lazy var service: Serviceable = { NetworkService() }()
    private lazy var newsListTask: NewsListTask = {
        NewsListTask(with: service, urlString: newsURLString)
    }()

    var bind: ( () -> Void ) = {}

    func fetchFxNews() {
        newsListTask.fetchFxNews {[weak self] result in
            switch result {
                case .success(let newsData):
                    self?.news = newsData
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }
}
