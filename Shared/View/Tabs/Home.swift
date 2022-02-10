//
//  Home.swift
//  iosdrawer (iOS)
//
//  Created by Ali Raza on 10/02/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .leading, spacing: 15){
                Image("Pic").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width-30, height: 250)
                    .cornerRadius(18)
                Text("HI this is ios developer herre....").font(.caption)
                    .foregroundColor(.gray)
            }.padding()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
