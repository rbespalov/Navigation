
import Foundation
import FirebaseAuth
import UIKit


enum LoginResult {
    case logined
    case invalidPassword
    case invalidEmailFormat
    case userDoesNotExist
}


protocol CheckerServiceProtocol {
    func chechCredentials(inputedLogin: String, inputedPass: String, completion: ((_ status: LoginResult)->Void)?)
    func signUp(inputedLogin: String, inputedPass: String, completion: ((_ isCreated: Bool)->Void)?)

}

class CheckerService: CheckerServiceProtocol {
    
    func chechCredentials(inputedLogin: String, inputedPass: String, completion: ((_ status: LoginResult)->Void)?) {
        
        
        FirebaseAuth.Auth.auth().signIn(withEmail: inputedLogin, password: inputedPass) { Result, error in
            
            var loginResult: LoginResult
            
            if let error {
                print(error.localizedDescription)
                if error.localizedDescription == "The password is invalid or the user does not have a password." {
                    loginResult = .invalidPassword
                    completion?(loginResult)
                    return
                } else if error.localizedDescription == "The email address is badly formatted." {
                    loginResult = .invalidEmailFormat
                    completion?(loginResult)
                    return
                } else if error.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted." {
                    loginResult = .userDoesNotExist
                    completion?(loginResult)
                    return
                }
            } else {
                loginResult = .logined
                completion?(loginResult)
                return
            }
        }
    }
    
    
    func signUp(inputedLogin: String, inputedPass: String, completion: ((_ isCreated: Bool)->Void)?) {
        
        FirebaseAuth.Auth.auth().createUser(withEmail: inputedLogin, password: inputedPass) { result, error in
            if let error {
                print(error.localizedDescription)
                completion?(false)
                return
            } else {
                completion?(true)
                return
            }
        }
    }
}
