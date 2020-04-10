//
//  TellWordView.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/09.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct TellWordView: View {
    @EnvironmentObject var gameData: GameData
    @State var tellWordFlg:Bool = false
    @State var index: Int = 0
    @State var nextFlg:Bool = false
    @State var watchedFlg:Bool = true
    @State var message:String = "次の人へ"
    
    var body: some View {
        VStack {
            if watchedFlg {
                Text("あなたは\(self.gameData.players   [self.index].name)さんですか?")
                Button(action: {
                    self.tellWordFlg = true
                }) {
                    Text("ワードを確認する")
                }.alert(isPresented: $tellWordFlg, content: {
                    Alert(title: Text("\(self.gameData.players   [self.index].name)さんのワード"), message: Text(self.gameData.players   [self.index].word), dismissButton: .default(Text(self.message), action: {
                        self.judgeNext()
                    }))
                })
            }
            if nextFlg {
                TimerView().environmentObject(self.gameData)
            }
        }
    }
    
    func judgeNext() {
        if index + 1 < self.gameData.players.count {
            tellWordFlg = false
            index += 1
            if index + 1 == self.gameData.players.count {
                message = "話し合い画面へ"
            }
        } else {
            watchedFlg = false
            nextFlg = true
        }
    }
}

struct TellWordView_Previews: PreviewProvider {
    static var previews: some View {
        TellWordView().environmentObject(GameData(names: ["テスト", "テスト2", "テスト3"]))
    }
}
