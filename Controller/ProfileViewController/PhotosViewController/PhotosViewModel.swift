//
//  PhotosViewModel.swift
//  Navigation
//
//  Created by Роман Беспалов on 25.09.2022.
//

import Foundation
import UIKit

final class PhotosViewModel {
    var imagesArray: [UIImage]
    
    var images: [UIImage]? {
        didSet {
            self.imageChanged?(self)
        }
    }
    
    init(model: [UIImage]) {
        self.imagesArray = model
    }
    
    var imageChanged: ((PhotosViewModel) -> ())?
    
    func makeArray() {
        images = imagesArray
    }
}
