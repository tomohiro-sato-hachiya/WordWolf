//
//  NameForm.swift
//  WordWolf
//
//  Created by 佐藤智宏 on 2020/04/10.
//  Copyright © 2020 佐藤智宏. All rights reserved.
//

import SwiftUI

struct NameForm: View {
    @Binding var playerNumber:Int
    @Binding var names: [String]
    
    var body: some View {
        VStack {
            ForEach(0 ..< playerNumber) { index in
                HStack {
                    Text("プレイヤー\(String (index + 1))")
                    TextField("", text:     self.$names[index])
                        .textFieldStyle (RoundedBorderTextFieldStyle())
                }
            }
        }
    }
}
