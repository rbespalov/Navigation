

import UIKit

 class CurrentUserService: UserService {
    
   public var currentUser = User(login: "morty", fullName: "Morty Smith", avatar: UIImage(named: "morty")!, status: "Okaaaay")

    public var password: String = "qwe"
    
    func check(login: String) -> User? {
        
        let user = currentUser
        return login == user.login ? user : nil
    }
}
