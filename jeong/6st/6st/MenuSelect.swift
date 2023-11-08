//
//  menuSelect.swift
//  6st
//
//  Created by 정의찬 on 11/8/23.
//

import SwiftUI

struct MenuSelect: View {
    var body: some View{
        VStack{
            HStack{
                Spacer()
                    .frame(width: 20)
                
                Text("알뜰한집배달")
                    .font(.title2)
                    .bold()
                Text("배민1 매일 쿠폰 드려요 할인 쿠폰")
                    .font(.caption)
                    .bold()
                Spacer()
                Image(systemName: "greaterthan")
                Spacer()
                    .frame(width: 20)
            }
            VStack{
                HStack(spacing:20){
                    Spacer()
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    MakeBtn(imgText: "chicken", imgName: "치킨")
                    MakeBtn(imgText: "pizza", imgName: "피자")
                    MakeBtn(imgText: "ham", imgName: "햄버거")
                    Spacer()
                }
                HStack(spacing:20){
                    Spacer()
                    MakeBtn(imgText: "icecream", imgName: "아이스크림")
                    MakeBtn(imgText: "dduck", imgName: "떡볶이")
                    MakeBtn(imgText: "sushi", imgName: "회")
                    MakeBtn(imgText: "ham", imgName: "햄버거")
                    Spacer()
                }
            }.frame(height: 140)
        }
    }
}

#Preview {
    MenuSelect()
}
