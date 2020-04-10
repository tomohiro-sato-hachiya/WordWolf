//
//  GameData.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/08.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import Foundation

class GameData: ObservableObject {
    @Published var players: [Player]
    
    init(names:[String]) {
        let theme:[String] = Words.selectTheme()
        let minority:String = theme.randomElement()!
        var majority:String = ""
        for word in theme {
            if word != minority {
                majority = word
                break
            }
        }
        let wolfName:String = names.randomElement()!
        players = []
        for name in names {
            var word:String = majority
            var wolfFlg:Bool = false
            if name == wolfName {
                word = minority
                wolfFlg = true
            }
            let player:Player = Player(name: name, word: word)
            player.wolfFlg = wolfFlg
            players.append(player)
        }
    }
}
