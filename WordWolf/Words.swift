//
//  Words.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/08.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import Foundation

class Words {
    static let words:[[String]] = [
        ["幼稚園", "保育園"]
        // TODO 他のお題を追加してください
    ]
    
    static func selectTheme() -> [String] {
        return words.randomElement()!
    }
}
