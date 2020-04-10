//
//  ElectView.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/10.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct ElectView: View {
    @EnvironmentObject var gameData: GameData
    @State var index: Int = 0
    @State var electedIndex: Int = 0
    @State var watchedFlg: Bool = true
    @State var continueFlg: Bool = true
    
    var body: some View {
        VStack {
            if watchedFlg {
                Text("\(gameData.players    [index].name)さん")
                Text("誰が人狼と思うか選んでください")
                Picker(selection: $electedIndex,    label: Text("この人に投票")) {
                    ForEach(0..<electList.count) { idx  in
                        Text(self.electList [idx].name).tag(idx)
                    }
                }
                Button(action: {
                    self.elect()
                }) {
                    Text("投票")
                }
            } else {
                next
            }
        }
    }
    
    var electList: [Player] {
        var players = gameData.players
        players.remove(at: index)
        return Array(players)
    }
    
    func setContinueFlg() {
        if self.index + 1 >= self.gameData.players.count {
            self.continueFlg = false
        }
    }
    
    var next: some View {
        let this = ElectView(index: index + 1, continueFlg: continueFlg).environmentObject(gameData)
        let next = ResultView().environmentObject(gameData)
        return continueFlg ? ViewBuilder.buildEither(first: this) :
        ViewBuilder.buildEither(second: next)
    }
    
    func elect() {
        let player = gameData.players[index]
        let elect = electList[electedIndex]
        player.elect = elect
        watchedFlg = false
        setContinueFlg()
    }

}

struct ElectView_Previews: PreviewProvider {
    static var previews: some View {
        ElectView(index: 0).environmentObject(GameData(names: ["テスト", "テスト2", "テスト3"]))
    }
}
