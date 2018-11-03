//
//  SearchRepositoryViewController.swift
//  LetsGitHubSearch
//
//  Created by Suyeol Jeon on 03/11/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import UIKit

import Alamofire

class SearchRepositoryViewController: UIViewController {
  let searchController = UISearchController(searchResultsController: nil)

  @IBOutlet private(set) var tableView: UITableView!
  @IBOutlet private(set) var activityIndicatorView: UIActivityIndicatorView!

  var currentSearchRequest: DataRequest?
  var repositories: [Repository] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    self.definesPresentationContext = true

    self.searchController.searchBar.delegate = self
    self.searchController.searchBar.autocapitalizationType = .none

    self.navigationItem.searchController = self.searchController
    self.navigationItem.hidesSearchBarWhenScrolling = false
  }
}

extension SearchRepositoryViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if let text = searchBar.text {
      self.search(keyword: text)
    }
    self.searchController.dismiss(animated: true, completion: nil)
  }

  private func search(keyword: String) {
    self.cancelPreviousSearchRequest()
    self.setLoading(true)

    self.currentSearchRequest = RepositoryService.search(keyword: keyword) { [weak self] result in
      guard let self = self else { return }
      self.setLoading(false)

      switch result {
      case let .success(searchResult):
        self.setSearchResult(searchResult)

      case let .failure(error):
        self.showErrorAlert(error: error)
      }
    }
  }

  private func cancelPreviousSearchRequest() {
    self.currentSearchRequest?.cancel()
  }

  private func setLoading(_ isLoading: Bool) {
    if isLoading {
      self.activityIndicatorView.stopAnimating()
      self.tableView.isHidden = true
    } else {
      self.activityIndicatorView.startAnimating()
      self.tableView.isHidden = false
    }
  }

  private func setSearchResult(_ searchResult: RepositorySearchResult) {
    self.repositories = searchResult.items
    self.tableView.reloadData()
  }

  private func showErrorAlert(error: Error) {
    let alertController = UIAlertController(title: "⚠️", message: error.localizedDescription, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alertController, animated: true, completion: nil)
  }
}

extension SearchRepositoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.repositories.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let repository = self.repositories[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
    cell.textLabel?.text = repository.name
    return cell
  }
}
