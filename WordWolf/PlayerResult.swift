//
//  PlayerResult.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/10.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct PlayerResult: View {
    var players: [Player]
    
    var body: some View {
        Section {
            ForEach(0 ..< players.count) { index    in
                VStack {
                    Text("\(self.players        [index].name):\(self        .getIdentity(player:        self.players[index]))")
                    Text("ワード:\(self.players    [index].word)")
                    Divider()
                }
            }
        }
    }
    
    func getIdentity(player: Player) -> String {
        if player.wolfFlg {
            return "人狼"
        } else {
            return "人間"
        }
    }
}

struct PlayerResult_Previews: PreviewProvider {
    static var previews: some View {
        let players:[Player] = [Player(name: "テスト", word: "ワード")]
        return PlayerResult(players: players)
    }
}
