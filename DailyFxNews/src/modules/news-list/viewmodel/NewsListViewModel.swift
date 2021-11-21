//
//  NewsListViewModel.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import Foundation

struct NewsListViewModel {

    private let newsURLString = "https://content.dailyfx.com/api/v1/dashboard"
    private(set) var news: [News]? { didSet { bind() }}
    private lazy var service: Serviceable = { NetworkService() }()
    private lazy var newsListTask: NewsListTask = {
        NewsListTask(with: service, urlString: newsURLString)
    }()

    var bind: ( () -> Void ) = {}

    mutating func fetchFxNews() {
        newsListTask.fetchFxNews()
    }
}
