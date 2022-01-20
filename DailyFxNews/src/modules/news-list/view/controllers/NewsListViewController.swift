//
//  NewsListViewController.swift
//  DailyFxNews
//
//  Created by Ronak on 21/11/21.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet private var newsTableView: UITableView!

    private let cellID = "NewsTableViewCell"
    private var viewModel: NewsListViewModel
    private let xibName = String(describing: NewsListViewController.self)
    private var dataSource: GenericTableViewDataSource<NewsCell, News>?

    init(viewModel: NewsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: xibName, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFxNews()
    }

    private func fetchFxNews() {
        viewModel.bind = { [weak self] in self?.updateDataSource() }
        viewModel.fetchFxNews()
    }

    private func updateDataSource() {
        guard let unwrappedNews = viewModel.news else {return}

        dataSource = GenericTableViewDataSource(with: cellID,
                                                 items: unwrappedNews,
                                                 configureCell: { cell, news in
                                                    cell.configure(with: news)
                                                 })
        DispatchQueue.main.async { [weak self] in
            self?.newsTableView.dataSource = self?.dataSource
            self?.newsTableView.reloadData()
        }
    }
}
