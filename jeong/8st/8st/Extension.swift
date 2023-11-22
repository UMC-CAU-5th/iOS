//
//  Extension.swift
//  8st
//
//  Created by 정의찬 on 11/22/23.
//

import Foundation
import SwiftUI

extension BottomOption {
    @ViewBuilder
    func createOptionItem(check: Bool, item: AddOption) -> some View {
        Button(action: {
            if dataModel.checkOption.contains(item) {
                dataModel.removeOption(option: item)
            } else {
                dataModel.addOption(option: item)
            }
            
            print("아래 옵션 누름") }, label: {
                HStack {
                    if dataModel.checkOption.contains(item) {
                        Image(systemName: "circle.fill")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .foregroundStyle(.black)
                    } else {
                        Image(systemName: "circle")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .foregroundStyle(.black)
                    }
                    
                    Text(item.name)
                        .foregroundStyle(.black)
                    Spacer()
                    Text("+\(item.price)원")
                        .foregroundStyle(.black)
                }
            })
    }
}

extension TopPrice {
    @ViewBuilder
    func createPriceItem(item: MenuPrice, selectedPrice: Binding<MenuPrice?>) -> some View {
        Button(action: {
            if item != selectedPrice.wrappedValue {
                selectedPrice.wrappedValue = item
                dataModel.itemPriceOfSize = item
                dataModel.updateSumMoney()
                print(dataModel.sumMoney)
            }
        }, label: {
            HStack{
                if item == selectedPrice.wrappedValue {
                    Image(systemName: "circle.fill")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .foregroundStyle(.black)
                } else {
                    Image(systemName: "circle")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .foregroundStyle(.black)
                }
                
                
                Text(item.menuSize)
                    .foregroundStyle(.black)
                Spacer()
                Text("+\(item.menuPrice)원")
                    .foregroundStyle(.blue)
            }
        })
    }
}

