//
//  CenterView.swift
//  6st
//
//  Created by 정의찬 on 11/8/23.
//

import SwiftUI

struct CenterView: View {
    var body: some View{
        ZStack{
            Color.white
            
            VStack{
                ZStack{
                    Color(red: 0.30, green: 0.78, blue: 0.89, opacity: 1.00)
                        .frame(height: 100)
                        .ignoresSafeArea(edges: .top)
                    SearchView()
                        .frame(alignment: .top)
                }
                HStack{
                    Spacer()
                        .frame(width: 10)
                    ScrollView{
                        VStack{
                            HStack{
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image("mart")
                                        .frame(width: 120, height: 120)
                                })
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image("deliver")
                                        .frame(width: 120, height: 120)
                                })
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image("store")
                                        .frame(width: 120, height: 120)
                                })
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                            Spacer()
                                .frame(width: 20)
                            
                            Spacer()
                            
                            ZStack{
                                Color.white
                                MenuSelect()
                                    .frame(height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            Image("adver")
                                .resizable()
                                .frame(width: 400,height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CenterView()
}
