//
//  MainView.swift
//  iosdrawer (iOS)
//
//  Created by Ali Raza on 09/02/2022.
//

import SwiftUI

struct MainView: View {
    //current tab
    @State var currentTab: String = "Home"
    
    //menu option
    @State var showMenu: Bool = false
    //hiding native tab bar
    init(){
        UITabBar.appearance().isHidden=true
    }
    var body: some View {
        ZStack{
            //Custom side menu
            SideMenu(currentTab: $currentTab)
            
            //MainTabView
            CustomTabView(currentTab: $currentTab,showMenu: $showMenu)
            //appling corner radius
                .cornerRadius(showMenu ?  25 : 0)
            //making 3d effect
                .rotation3DEffect(.init(degrees: showMenu ? -15 : 0),axis: ( x: 0,y:1,z:0),anchor: .trailing )
            //moving view apart
                .offset(x: showMenu ? getRect().width/2:0)
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//extending view to get safe area values
extension View{
    func getSafeArea()->UIEdgeInsets{
        guard let screen =
                UIApplication.shared.connectedScenes.first as?
                UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets
        else{
            return .zero
        }
        return safeArea
    }
}
