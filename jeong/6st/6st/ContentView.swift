//
//  ContentView.swift
//  6st
//
//  Created by 정의찬 on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        TabView{
            CenterView()
                .tabItem {
                    Image("search")
                    Text("검색")
                }
            Text("2222")
                .tabItem{
                    Image("heart")
                    Text("찜")
                }
            Text("center")
                .tabItem{
                    Image("mark")
                }
            Text("3333")
                .tabItem{
                    Image("word")
                    Text("주문내역")
                }
            Text("44444")
                .tabItem{
                    Image("human")
                    Text("my배민")
                }
        }
    }
}
#Preview {
        ContentView()
}
