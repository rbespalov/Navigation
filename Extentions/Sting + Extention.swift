//
//  Sting + Extention.swift
//  Navigation
//
//  Created by Роман Беспалов on 22.11.2022.
//

import Foundation

extension String {

    func replace(_ pattern: String, replacement: String) throws -> String {
        let regex = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
        return regex.stringByReplacingMatches(in: self,
                                              options: [.withTransparentBounds],
                                              range: NSRange(location: 0, length: self.count),
                                              withTemplate: replacement)
    }
}
