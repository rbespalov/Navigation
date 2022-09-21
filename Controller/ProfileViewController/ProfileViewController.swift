
import UIKit

class ProfileViewController: UIViewController {

    fileprivate lazy var data = ProfilePost.make()
    
    var currenUser: User? = nil
    
    private var profileView: ProfileView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! ProfileView)
    }
    
    override func loadView() {
            super.loadView()
            
            let profileView = ProfileView()
            profileView.configure()
            profileView.setupConstraints()
            
            view = profileView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
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
                withIdentifier: ProfileView.CellReuseID.photos.rawValue,
                for: indexPath
            ) as? PhotosTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }

            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProfileView.CellReuseID.base.rawValue,
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
                        withIdentifier: ProfileView.HeaderFooterReuseID.base.rawValue
                    ) as? ProfileTableHederView else {
                        fatalError("could not dequeueReusableCell")
                    }
            if let currentUser = currenUser {
                headerView.setup(fullName: currentUser.fullName, statusText: currentUser.status, avatar: currentUser.avatar)
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
