//
//  Player.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/08.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import Foundation

class Player: ObservableObject {
    @Published var name: String
    @Published var word: String
    @Published var elect: Player?
    @Published var wolfFlg:Bool = false
    
    init(name: String, word: String) {
        self.name = name
        self.word = word
    }
}
