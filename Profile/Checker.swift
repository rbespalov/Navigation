

import UIKit

class Checker {
    
    static let shared = Checker()
    private init() {}
    
    private let login: String = "rick"
    private let password: String = "asd"
    
    func check (inputedLogin: String, inputedPass: String) -> Bool {
        let login = login
        let pass = password
        
        return inputedLogin == login && inputedPass == pass ? true : false
    }
    
}
