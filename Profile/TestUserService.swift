

import UIKit

class TestUserService: UserService {
    
    let testUser: User = User(login: "test", fullName: "Test Bot", avatar: UIImage(named: "logo")!, status: "Testiiiing")
    
    let password: String = "test"
    
    func check(login: String) -> User? {
        let user = testUser
        if login == user.login {
            return user
        } else {
            return nil
        }
    }
}
