//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Роман Беспалов on 22.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Data
    
    fileprivate lazy var data = ProfilePost.make()
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .grouped
        )
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private enum CellReuseID: String {
        case base = "BaseTableView_ReuseID"
        case photos = "PhotosTableView_ReuseID"
    }
    
    private enum HeaderFooterReuseID: String {
        case base = "TableSectionFooterHeaderView_ReuseID"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubViews()
        setupConstraints()
        tuneTableView()
    }
    
    // MARK: - Private
 
    private func setupView() {
        
        #if DEBUG
        self.view.backgroundColor = .green
        #else
        self.view.backgroundColor = .systemGray6
        #endif
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func addSubViews() {
        view.addSubview(tableView)
        
    }
    
    private func setupConstraints() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .systemGray6
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.base.rawValue
        )
        
        tableView.register(
            PhotosTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.photos.rawValue)
        
        tableView.register(
            ProfileTableHederView.self,
            forHeaderFooterViewReuseIdentifier: HeaderFooterReuseID.base.rawValue
        )

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        2
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        if section == 0 {
            return 1
        } else {
           return data.count
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseID.photos.rawValue,
                for: indexPath
            ) as? PhotosTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }

            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.base.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        
        let data = data[indexPath.row]
        cell.setup(with: data)
        
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        
        if section == 0 {
           return 250
        } else {
           return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        
        if section == 0 {
            
            guard let headerView =
                    tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: HeaderFooterReuseID.base.rawValue
                    ) as? ProfileTableHederView else {
                        fatalError("could not dequeueReusableCell")
                    }
            
            return headerView
        } else {
            let emptyHeader = UIView()
            return emptyHeader
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if indexPath.section == 0 {
            
            let nextViewController = PhotosViewController()
            navigationController?.navigationBar.isHidden = false
            navigationController?.pushViewController(
                nextViewController, animated: true
                
            )
        }
    }
}
