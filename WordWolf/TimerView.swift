//
//  TimerView.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/10.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @State var counter:Int = 180
    @EnvironmentObject var gameData: GameData
    @State var buttonFlg = true
    
    var body: some View {
        VStack {
            if 0 < counter {
                Text("残り:\(counter)秒")
                if buttonFlg {
                    Button(action: {
                        self.start()
                        self.buttonFlg = false
                    }) {
                        Text("開始")
                    }
                }
            } else {
                ElectView().environmentObject(gameData)
            }
        }
    }
    
    func start() {
        print(self.counter)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.counter -= 1
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(GameData(names: ["テスト", "テスト2", "テスト3"]))
    }
}
