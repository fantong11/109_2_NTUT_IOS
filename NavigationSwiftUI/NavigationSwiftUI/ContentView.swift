//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by 范桶 on 2021/5/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("Conan")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                NavigationLink(
                    destination: MovieDetails(),
                    label: {
                        Text("Movie Details")
                    })
                NavigationLink(
                    destination: MovieActors(),
                    label: {
                        Text("Movie Actors")
                    })
            }
            .navigationTitle("Case Closed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
