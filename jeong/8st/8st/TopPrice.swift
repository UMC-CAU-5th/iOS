//
//  TopPrice.swift
//  8st
//
//  Created by 정의찬 on 11/22/23.
//

import SwiftUI

struct TopPrice: View {
    @Binding var priceList: [MenuPrice]
    @State var dataModel: DataModel
    @State var selectedPrice: MenuPrice?
    var  body: some View {
        VStack{
            HStack{
                Text("가격")
                Spacer()
                Text("필수")
            }
            ForEach(priceList) { item in
            createPriceItem(item: item, selectedPrice: $selectedPrice)
            }
        }
    }
}
