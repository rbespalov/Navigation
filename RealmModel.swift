
import Foundation
import RealmSwift


class UserModel: Object {
    
    @Persisted var name: String
    @Persisted var password: String
    
}

class RealmService {
    
    let realm = try! Realm()
    
    func createUser(name: String, password: String) {
        let user = UserModel()
        user.name = name
        user.password = password
        
        try! realm.write({
            realm.add(user)
        })
    }
}
