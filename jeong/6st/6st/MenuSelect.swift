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
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    Spacer()
                }
                HStack(spacing:20){
                    Spacer()
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    MakeBtn(imgText: "bossam", imgName: "보쌈")
                    Spacer()
                }
            }.frame(height: 140)
        }
    }
}

#Preview {
    MenuSelect()
}
