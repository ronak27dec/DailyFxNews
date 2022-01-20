//
//  NewsCategoryViewController.swift
//  DailyFxNews
//
//  Created by Ronak on 22/11/21.
//

import UIKit

class NewsCategoryViewController: UIViewController {

    @IBOutlet var categoryTableView: UITableView!

    private let navigationTitle = "News"
    private let cellID = "CategoryTableViewCell"
    private let xibName = String(describing: NewsCategoryViewController.self)
    private var viewModel: NewsCategoryViewModel
    private var dataSource: GenericTableViewDataSource<NewsCategoryCell, String>?

    init(viewModel: NewsCategoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: xibName, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = navigationTitle
        let nibName = UINib(nibName: "NewsCategoryCell", bundle: nil)
        self.categoryTableView.register(nibName, forCellReuseIdentifier: cellID)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bind()
        getNewsCategories()
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in self?.viewModel.fetchFxNews() }
    }

    private func bind() {
        viewModel.bindCategory = { [weak self] in self?.updateDataSource() }
        viewModel.bindNewsListOnSuccess = { [weak self] in self?.didFetchNewsWithSuccess() }
        viewModel.bindNewsListOnFailure = { [weak self] in self?.didFetchNewsWithFailure() }
    }

    private func getNewsCategories() {
        viewModel.getNewsCategory()
    }

    private func updateDataSource() {
        guard let unwrappedCategories = viewModel.categories else {return}
        dataSource = GenericTableViewDataSource(with: cellID,
                                                items: unwrappedCategories,
                                                configureCell: { cell, item in
                                                    cell.accessoryType = .disclosureIndicator
                                                    cell.configure(with: item)
                                                })
        DispatchQueue.main.async {
            self.categoryTableView.dataSource = self.dataSource
            self.categoryTableView.delegate = self
            self.categoryTableView.reloadData()
        }
    }

    private func didFetchNewsWithSuccess() {
        print("Did Fetch News With Success!")
    }

    private func didFetchNewsWithFailure() {

    }
}

extension NewsCategoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let unwrappedNews = viewModel.news else {return}

        switch indexPath.row {
            case 0:
                print(unwrappedNews.breakingNews)
                break
            case 1:
                print(unwrappedNews.topNews)
                break
            case 2:
                print(unwrappedNews.dailyBriefings)
                break
            case 3:
                print(unwrappedNews.technicalAnalysis)
                break
            case 4:
                print(unwrappedNews.specialReport)
                break
            default:
                break
        }

    }

}
