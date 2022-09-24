

import UIKit

class FeedModel {
    
    let secretWord: String = "portal"
    
    func check (word: String) -> Bool {
        secretWord == word
    }
}
