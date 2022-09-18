

import UIKit

class FeedModel {
    
    let secretWord: String = "portal"
    
    func check (word: String) -> Bool {
        let input = word
        
        return secretWord == input ? true : false
    }
}
