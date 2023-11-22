//
//  BottomOption.swift
//  8st
//
//  Created by 정의찬 on 11/22/23.
//

import SwiftUI

struct BottomOption: View {
    @Binding var selectedOptionList: [AddOption]
    @State var selectedOption: Set<AddOption>
    @State var dataModel: DataModel
    var body: some View{
        VStack{
            HStack{
                Text("살찌고 싶으면 추가해")
                Spacer()
                Text("정말 선택할거야?")
            }
            ForEach(selectedOptionList){ item in
                createOptionItem(check: selectedOption.contains(item), item: item)
            }
        }
    }
    
}
