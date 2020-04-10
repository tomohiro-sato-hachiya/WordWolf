//
//  ResultView.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/10.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var gameData: GameData
    
    var wolfWonFlg: Bool {
        var count = 0
        for player in gameData.players {
            if player.elect!.wolfFlg {
                count += 1
            }
        }
        if Double(count) < (Double(gameData.players.count) / 2.0) {
            return true
        } else {
            return false
        }
    }
    
    var winners: [Player] {
        var result:[Player] = []
        for player in gameData.players {
            if (judgeWin(player: player)) {
                result.append(player)
            }
        }
        return result
    }
    
    var losers: [Player] {
        var result:[Player] = []
        for player in gameData.players {
            if (!judgeWin(player: player)) {
                result.append(player)
            }
        }
        return result
    }
    
    var message:String {
        if wolfWonFlg {
            return "人狼側の勝利"
        } else {
            return "人間側の勝利"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(message)
                Divider()
                Text("勝者リスト")
                PlayerResult(players: winners)
                Text("敗者リスト")
                PlayerResult(players: losers)
            }
        }
    }
    
    func judgeWin(player: Player) -> Bool {
        if player.wolfFlg {
            return wolfWonFlg
        } else if !wolfWonFlg && player.elect!.wolfFlg {
            return true
        }
        return false
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        let gameData = GameData(names: ["テスト", "テスト2", "テスト3"])
        gameData.players[0].elect = gameData.players[1]
        gameData.players[1].elect = gameData.players[0]
        gameData.players[2].elect = gameData.players[0]
        return ResultView().environmentObject(gameData)
        
    }
}
