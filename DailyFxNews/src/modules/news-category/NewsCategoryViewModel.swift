//
//  NewsCategoryViewModel.swift
//  DailyFxNews
//
//  Created by Ronak on 22/11/21.
//

import Foundation

class NewsCategoryViewModel {

    private(set) var categories: [String]? { didSet { bindCategory() }}
    private(set) var didFetchNewsWithSuccess: Bool = false { didSet { bindNewsListOnSuccess() }}
    private(set) var didFetchNewsWithFailure: Bool = false { didSet { bindNewsListOnFailure() }}
    private(set) var news: News?
    private lazy var service: Serviceable = { NetworkService() }()
    private lazy var newsListTask: NewsListTask = { NewsListTask(with: service) }()

    var bindCategory: ( () -> Void ) = {}
    var bindNewsListOnSuccess: ( () -> Void ) = {}
    var bindNewsListOnFailure: ( () -> Void ) = {}


    func getNewsCategory() {
        let categoryArray = [ NewsCategory.breakingNews.rawValue,
                              NewsCategory.topNews.rawValue,
                              NewsCategory.dailyBriefings.rawValue,
                              NewsCategory.technicalAnalysis.rawValue,
                              NewsCategory.specialReport.rawValue
        ]

        categories = categoryArray
    }

    func fetchFxNews() {
        newsListTask.fetchFxNews {[weak self] result in
            switch result {
                case .success(let newsData):
                    self?.news = newsData
                    self?.didFetchNewsWithSuccess = true
                case .failure(let error):
                    print("Error: \(error)")
                    self?.didFetchNewsWithFailure = true
            }
        }
    }
}
