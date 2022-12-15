

import Foundation
import UIKit

class FavoritePostViewController: UIViewController {
    
    var posts: [FavoritePost] = []

    private lazy var tableVIew: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(tableVIew)
        setupConstraints()
        tuneTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        posts = CoreDataManager.shared.posts
        self.tableVIew.reloadData()
    }
    
    
    private func setupConstraints() {
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableVIew.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableVIew.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableVIew.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableVIew.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func tuneTableView() {
        tableVIew.rowHeight = UITableView.automaticDimension
        tableVIew.backgroundColor = .systemGray6
        tableVIew.register(PostTableViewCell.self, forCellReuseIdentifier: "likedPostCell")
        tableVIew.dataSource = self
        tableVIew.delegate = self
    }
}

extension FavoritePostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "likedPostCell", for: indexPath) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        let data = posts[indexPath.row]
        cell.authotLabel.text = data.author
        cell.postImage.image = UIImage(named: data.image!)
        cell.numberOfLikes.text = "Likes: \(data.likes)"
        cell.numberOfViews.text = "Views: \(data.views)"
        cell.postDescription.text = data.descript
        return cell
    }
}
