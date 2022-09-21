
import UIKit

class ProfileView: UIView {


    lazy var tableView = UITableView(frame: .zero, style: .grouped)
    
    enum CellReuseID: String {
        case base = "BaseTableView_ReuseID"
        case photos = "PhotosTableView_ReuseID"
    }
    
    enum HeaderFooterReuseID: String {
        case base = "TableSectionFooterHeaderView_ReuseID"
    }
    
    func configure() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        
        #if DEBUG
        backgroundColor = .green
        #else
        backgroundColor = .systemGray6
        #endif
        
        addSubview(tableView)

    }
    func setupConstraints() {
        
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}
