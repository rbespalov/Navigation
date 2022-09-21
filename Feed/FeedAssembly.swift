
import Foundation
import UIKit

final class FeedAssembly {
    
    func create(
        output: FeedOutput
    ) -> FeedViewController {
        
        let view = FeedViewController()
        let presenter = FeedPresenter(
            output: output,
            view: view
        )
        
        view.output = presenter
        
        return view
    }
}

