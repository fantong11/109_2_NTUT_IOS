//
//  ContentView.swift
//  FingerGuessingGame
//
//  Created by 范桶 on 2021/5/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = FingerGuessingGame()
    var body: some View {
        VStack {
            Text("猜拳遊戲")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Text("玩家：")
                Image(game.playerGuess?.rawValue ?? "rock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                Text(game.playerGuess?.rawValue ?? "rock")
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            
            HStack {
                Text("電腦：")
                Image(game.computerGuess?.rawValue ?? "rock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                Text(game.computerGuess?.rawValue ?? "rock")
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            Spacer()
            
            Image("scissor")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            HStack {
                Image("rock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                Button(action: {
                    game.play()
                }, label: {
                    Text("出拳")
                })
                Image("paper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            HStack {
                Text("結果：")
                Text(game.getResult())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
