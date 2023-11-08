//
//  SwiftUIView.swift
//  6st
//
//  Created by 정의찬 on 11/8/23.
//

import SwiftUI

struct SearchView: View {
    @State private var SearchText = "주소 검색해라"
    var body: some View{
        ZStack{
            Color(red: 0.30, green: 0.78, blue: 0.89, opacity: 1.00)
            VStack{
                HStack{
                    Text("동작구 어딘가")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .offset(CGSize(width: 20, height: 0))
                    Spacer()
                    
                    Button(action: {print("clickOne")}, label: {
                        Image(systemName: "square.grid.2x2")
                    })
                    .offset(CGSize(width: -20, height: 0))
                            
                    Button(action: {print("clickTwo")}, label: {Image(systemName: "bell")
                    })
                    .offset(CGSize(width: -20, height: 0))
                    
                    Button(action: {print("clickThree")}, label: {
                        Image(systemName: "cart")
                    })
                    .offset(CGSize(width: -20, height: 0))
                }
                SearchBar(text: $SearchText)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
            }
        }
        .frame(height:100)
    }
}

#Preview {
    SearchView()
}

struct SearchBar: View{
    @Binding var text: String
    
    var body: some View{
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                
                TextField("검색",text: $text)
                    .foregroundStyle(.primary)
                
                if !text.isEmpty{
                    Button(action: {self.text = ""}){
                        Image(systemName: "xamrk.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .foregroundStyle(.secondary)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal)
    }
}
