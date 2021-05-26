//
//  ContentView.swift
//  ToDoApp
//
//  Created by 范桶 on 2021/5/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ToDoViewModel = ToDoViewModel()
    
    var body: some View {
        VStack {
            Text("ToDO App")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            
            Group {
                Text("輸入數據")
                    .padding()
                HStack {
                    Text("名稱：")
                    TextField("請輸入", text: $viewModel.name)
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("是否完成：")
                    TextField("請輸入", text: $viewModel.isFinish)
                    Spacer()
                }
                .padding()
                
                HStack {
                    DatePicker("到期時間：", selection: $viewModel.time)
                    Spacer()
                }
                .padding()
                
                Button(action: {
                    viewModel.createToDo()
                }, label: {
                    Text("新增數據")
                        .padding()
                })
            }
            
            
            
            Text("------------------------------------------")
            
            Group {
                Text("目前數據")
                    .padding()
                HStack {
                    Text("名稱：")
                    Text("\(viewModel.fetchName)")
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("是否完成：")
                    Text("\(viewModel.fetchIsFinish)")
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("到期時間：")
                    Text("\(viewModel.fetchExpireTime)")
                    Spacer()
                }
                .padding()
                
                Button(action: {
                    viewModel.fetchToDoById()
                }, label: {
                    Text("讀取數據")
                        .padding()
                })
            }
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
