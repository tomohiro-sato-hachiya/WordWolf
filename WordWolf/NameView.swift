//
//  NameView.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/09.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct NameView: View {
    @State var playerNumber:Int = 0
    @State var names:[String] = [
        "プレイヤー1",
        "プレイヤー2",
        "プレイヤー3",
        "プレイヤー4",
        "プレイヤー5",
        "プレイヤー6",
        "プレイヤー7",
        "プレイヤー8",
        "プレイヤー9",
        "プレイヤー10",
        "プレイヤー11",
        "プレイヤー12",
        "プレイヤー13",
        "プレイヤー14",
        "プレイヤー15",
        "プレイヤー16",
        "プレイヤー17",
        "プレイヤー18",
        "プレイヤー19",
        "プレイヤー20",
        "プレイヤー21",
        "プレイヤー22",
        "プレイヤー23",
        "プレイヤー24",
        "プレイヤー25",
        "プレイヤー26",
        "プレイヤー27",
        "プレイヤー28",
        "プレイヤー29",
        "プレイヤー30"
    ]
    @State var watchedFlg:Bool = true
    
    var body: some View {
        let this = ScrollView {
            VStack {
                NameForm(playerNumber:          $playerNumber, names: $names)
                Button(action: {
                    self.watchedFlg = false
                }) {
                    Text("ゲーム開始")
                }
            }
        }
        let next = TellWordView().environmentObject(makeGameData())
        return VStack {
            if watchedFlg {
                this
            } else {
                next
            }
        }
    }
    
    func makeGameData() -> GameData {
        let limitedNames = Array(names[0 ..< playerNumber])
        let gameData = GameData(names: limitedNames)
        return gameData
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(playerNumber: 30)
    }
}
