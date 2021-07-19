//
//  MainView.swift
//  EZheLi
//
//  Created by 陈驰坤 on 2021/6/29.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("主页")
                }
            
            Text("Here is Person Page")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("我的")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
