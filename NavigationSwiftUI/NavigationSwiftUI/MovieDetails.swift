//
//  MovieDetails.swift
//  NavigationSwiftUI
//
//  Created by 范桶 on 2021/5/5.
//

import SwiftUI

struct MovieDetails: View {
    let info = ["世界最大的體育盛會「WSG -World Sports Games-」暌違多年將在東京舉辦。", "日本為盛大舉行開幕儀式，展現日本最尖端技術──世界首創最高時速1000km的「真空超電導新幹線」", "，在新名古屋站和東京之間開通！", "在世人目光的注視下，知名大會贊助商匯集的會場中，", "各大企業老闆光天化日下相繼被綁架。此時，卻發現赤井秀一竟在背地監視，", "並指揮FBI成員們的行動。同時，柯南想起15年前在美國波士頓發生的驚悚WSG連續綁架事件也是由FBI負責偵查，", "或許這一場事件，敵人就是自己人，然而各種證據顯示出的不在場證明，難以讓真相水落石出……"]
    var body: some View {
        VStack {
            Image("Conan")
                .resizable()
                .scaledToFit()
                .frame(height: 300, alignment: .top)
            ForEach(0..<info.count) { index in
                Text(info[index])
            }
            Spacer()
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails()
    }
}
