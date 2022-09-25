//
//  FeedPresenter.swift
//  Navigation
//
//  Created by Роман Беспалов on 21.09.2022.
//

import Foundation

protocol FeedViewOutput: AnyObject {
    func showPostTapped()
}

protocol FeedViewInput: AnyObject {
    
}

class FeedPresenter {
    
    weak var output: FeedOutput?
    weak var view: FeedViewInput?
    
    
    // MARK: - Lifecycle
    
    init(
        output: FeedOutput,
        view: FeedViewInput
    ) {
        self.output = output
        self.view = view
    }
}

extension FeedPresenter: FeedViewOutput {
    func showPostTapped() {
        output?.showPostTapped()
    }
}

extension FeedPresenter: FeedViewInput {
    
}
