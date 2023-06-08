//
//  MainVC.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import UIKit

final class MainVC: BaseVC {
    
    var presenter: MainPresenter!
    
    private let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        setupLayout()
    }
    
    private func configTableView() {
        let cells = presenter.setCells()
        tableView.register(cellTypes: cells)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupLayout() {
        view.addSubviewWithoutAutoresizing(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MainVC: MainViewInput {
    func success() {
        tableView.reloadData()
    }
    
    func failure(_ error: Error) {
        print(error.localizedDescription)
    }
    
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.name
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailVC = ModuleBuilder.createDetailScreen(model: comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}

