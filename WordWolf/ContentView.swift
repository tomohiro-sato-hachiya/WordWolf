//
//  ContentView.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/08.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var playerNumber:Int = 3
    
    var body: some View {
        NavigationView {
            VStack {
                Text("3人以上30人以下でスタート")
                Stepper(onIncrement: {
                    self.playerNumber += 1
                    self.playerNumber =
                    min(self.playerNumber, 30)
                }, onDecrement: {
                    self.playerNumber -= 1
                    self.playerNumber =
                        max(self.playerNumber, 3)
                }) {
                    Text("人数:\(playerNumber)")
                }
                NavigationLink(destination: NameView(playerNumber: playerNumber)) {
                    Text("次へ")
                }
            }.navigationBarTitle("トップ")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
