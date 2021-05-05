//
//  MovieActors.swift
//  NavigationSwiftUI
//
//  Created by 范桶 on 2021/5/5.
//

import SwiftUI

struct MovieActors: View {
    var body: some View {
        let info = ["導演：青山剛昌",
                    "演員：高山南 、 池田秀一 、 森川智之 、 田中敦子(Atsuko Tanaka)",
                    "類型：動畫、動作、懸疑、驚悚" ,
                    "片長：1 時 50 分"]
        VStack(alignment: .leading) {
            ForEach(0..<info.count) { index in
                Text(info[index])
            }
            
        }
        
    }
}

struct MovieActors_Previews: PreviewProvider {
    static var previews: some View {
        MovieActors()
    }
}
