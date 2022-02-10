//
//  CustomTabView.swift
//  iosdrawer (iOS)
//
//  Created by Ali Raza on 10/02/2022.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: String
    @Binding var showMenu: Bool
   
   
    var body: some View {
        VStack{
            //static header view for all pages
            HStack{
                
                //menu button
                Button{
                    withAnimation(.spring()){
                        showMenu=true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                //hidding when menu
                .opacity(showMenu ? 0:1)
                Spacer()
                Image("Pic").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .cornerRadius(5)
                
            }.padding([.horizontal,.top])
                .padding(.bottom,8)
                .padding(.top,getSafeArea().top)
                .overlay(
                    Text(currentTab).font(.title2.bold()).foregroundColor(.white)
                    //same hiding when menu is visible
                        .opacity(showMenu ? 0:1)
                )
            
            TabView(selection: $currentTab){
                //replace your custom view here
                Home().tag("Home")
                Text("Discover").tag("Discover")
                Text("Devices").tag("Devices")
                Text("Profile").tag("Profile")
                Text("Home").tag("Home")
            }
        }.disabled(showMenu)
        .frame(maxWidth:.infinity,maxHeight:.infinity)
            .background(.black)
            .overlay(
                //menu close button
                Button{
                    withAnimation(.spring()){
                        showMenu=false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.white)
                } .opacity(showMenu ? 1:0)
                    .padding()
                    .padding(.top)
                ,alignment: .topLeading
            )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
