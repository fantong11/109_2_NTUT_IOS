//
//  ContentView.swift
//  SwiftUIComponent
//
//  Created by 范桶 on 2021/5/12.
//

import SwiftUI

struct ContentView: View {
    let name = "澤野弘之"
    @State var isFan = "不是"
    @State var toggleOn = false
    @State var age = 20
    @State var birthday = Date()
    @State var sliderValue: CGFloat = 1
    @State var selectedIndex = 0
    @State var text = ""
    @State var showAlert = false
    let songs = ["Aliez", "βίος", "The Reluctant Heroes", "EGO"]
    
    var body: some View {
        VStack {
            Text(name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack(alignment: .bottom) {
                Image("SawanoHiroyuki")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 20)
                
                
            }
            HStack {
                Spacer()
                if toggleOn == true {
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                
                } else {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .padding([.trailing, .leading])
            
            
            Toggle(isOn: $toggleOn, label: {
                Text("是粉絲嗎")
            })
            .onChange(of: toggleOn, perform: { value in
                if value {
                    isFan = "是"
                } else {
                    isFan = "不是"
                }
            })
            .padding([.trailing, .leading])
            
            Stepper("年齡：\(age)", value: $age, in: 0...100)
                .padding([.trailing, .leading])
            DatePicker("生日：", selection: $birthday, displayedComponents: .date)
                .padding([.trailing, .leading])
            
            HStack {
                Text("喜歡程度：")
                Slider(value: $sliderValue, in: 0...20, step: 1)
                Text("\(Int(sliderValue))")
            }
            .padding([.trailing, .leading])
            
            HStack {
                Spacer()
                Text("喜歡的歌")
                Picker("喜歡的歌", selection: $selectedIndex) {
                    ForEach(songs.indices) { index in
                        Text(songs[index])
                    }
                }
                
            }
            .padding([.trailing, .leading])
            TextField("Enter", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.trailing, .leading])
            Button("送出") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("我\(isFan)澤野弘之的粉絲"),
                        message: Text("他今年\(age)歲\n\(birthday)\n我\(Int(sliderValue))分喜歡他\n\(songs[selectedIndex])\n\(text)")
                    )
                }
//            Spacer()
        
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
