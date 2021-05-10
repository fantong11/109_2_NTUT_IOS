//
//  ContentView.swift
//  swiftUIPractice
//
//  Created by 范桶 on 2021/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var dieNum1 = 1
    @State private var dieNum2 = 1
    @State private var dieNum3 = 1
    @State private var guess = ""
    @State private var money = 1000
    @State private var currentState = "猜測中"
    var body: some View {
        VStack {
            Text("骰子遊戲")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack {
                Image(systemName: "die.face.\(dieNum1)")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("骰子1數字：\(dieNum1)")
            }
            HStack {
                Image(systemName: "die.face.\(dieNum2)")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("骰子2數字：\(dieNum2)")
            }
            HStack {
                Image(systemName: "die.face.\(dieNum3)")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("骰子2數字：\(dieNum3)")
            }
            HStack{
                TextField("請輸入猜測總和", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                Button(action: {
                    
                    dieNum1 = Int.random(in: 1...6)
                    dieNum2 = Int.random(in: 1...6)
                    dieNum3 = Int.random(in: 1...6)
                    if dieNum1 + dieNum2 + dieNum3 < Int(guess) ?? 0 {
                        currentState = "猜測成功加100元"
                        money += 100
                    } else {
                        currentState = "猜測失敗減100元"
                        money -= 100
                    }
                }, label: {
                    Text("猜測")
                })
                .padding()
            }
            .padding()
            Text("猜測結果：\(currentState)")
            Text("目前金額：\(money)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
