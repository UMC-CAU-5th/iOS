//
//  makeBtn.swift
//  6st
//
//  Created by 정의찬 on 11/8/23.
//

import SwiftUI

struct MakeBtn: View {
    @State var imgText: String
    @State var imgName: String
    
    var body: some View{
        VStack{
            ZStack{
                Color.white
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(imgText)
                })
            }
            .clipShape(Circle())
            Text(imgName)
                .font(.caption)
                .fixedSize()
        }
    }
}
