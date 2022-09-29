
import UIKit

struct Images {

    static let imageName: [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "8")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!, UIImage(named: "9")!, UIImage(named: "10")!, UIImage(named: "11")!, UIImage(named: "12")!, UIImage(named: "13")!, UIImage(named: "14")!, UIImage(named: "15")!, UIImage(named: "16")!, UIImage(named: "17")!, UIImage(named: "18")!, UIImage(named: "19")!, UIImage(named: "20")!]
}
struct Photo {
    
    let photoName: String
}

extension Photo {
   
    static func makePhoto() -> [Photo] {
        [
            Photo(photoName: "1"
            ),
            Photo(photoName: "2"
            ),
            Photo(photoName: "3"
            ),
            Photo(photoName: "4"
            ),
            Photo(photoName: "5"
            ),
            Photo(photoName: "6"
            ),
            Photo(photoName: "7"
            ),
            Photo(photoName: "8"
            ),
            Photo(photoName: "9"
            ),
            Photo(photoName: "10"
            ),
            Photo(photoName: "11"
            ),
            Photo(photoName: "12"
            ),
            Photo(photoName: "13"
            ),
            Photo(photoName: "14"
            ),
            Photo(photoName: "15"
            ),
            Photo(photoName: "16"
            ),
            Photo(photoName: "17"
            ),
            Photo(photoName: "18"
            ),
            Photo(photoName: "19"
            ),
            Photo(photoName: "20"
            ),
        ]
    }
    
}
