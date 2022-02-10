//
//  SideMenu.swift
//  iosdrawer (iOS)
//
//  Created by Ali Raza on 09/02/2022.
//

import SwiftUI

struct SideMenu: View {
    @Binding var currentTab: String
    
    //Adding smoot transition between tabs with the help of match Geometry effect.
    @Namespace var animation
    var body: some View {

        VStack{
            HStack(spacing: 15){
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode:.fill)
                    .frame(width:45,height:45)
                    .clipShape(Circle())
                Text("iJustine")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }.padding()
                .frame(maxWidth:.infinity,alignment: .leading)
            
            ScrollView(getRect().height < 750 ? .vertical : .init(),showsIndicators: false,content: {
                //Tab Buttons
                VStack(alignment:.leading,spacing:25){
                    CustomTabButton(icon: "theatermasks.fill", title: "Home")
                    CustomTabButton(icon: "safari.fill", title: "Discover")
                    CustomTabButton(icon: "applewatch", title: "Devices")
                    CustomTabButton(icon: "person.fill", title: "Profile")
                    CustomTabButton(icon: "gearshape.fill", title: "Setting")
                    CustomTabButton(icon: "info.circle.fill", title: "About")
                    CustomTabButton(icon: "questionmark.circle.fill", title: "Help")
                    Spacer()
                    //making Logout button constant with orange color
                    CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
                    
                }.padding()
                    .padding(.top,45)
            })
                
            //max width of screen width
                .frame(width:getRect().width/2,alignment: .leading)
                .frame(maxWidth:.infinity,alignment: .leading)
            
        }            .padding(.leading,10)
        .frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.top)
            .background(Color("BG"))


    }
    
    //custom button
    @ViewBuilder
    func CustomTabButton(icon:String,title:String)->some View{
        Button{
            if title=="Logout"{
                print("Logout")
            }else{
                withAnimation{
                    currentTab = title
                }
            }
        }label: {
            HStack(spacing: 12){
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ?  48 : nil,height: 48)
                    .foregroundColor(currentTab == title ? Color("Purple"): (title=="Logout" ? Color("Orange"): .white))
                    .background(
                    
                        ZStack{
                            if currentTab == title{
                                Color.white.clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                    
                    )
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(title=="Logout" ? Color("Orange"): .white)
            }
            .padding(.trailing,18)
            .background(
                ZStack{
                    if currentTab == title{
                        Color("Purple")
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
                
            )
        }.offset(x: currentTab == title ? 15 : 0)
        
    }
    
    
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extending view to get screen bounds
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
