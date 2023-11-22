//
//  DataModel.swift
//  8st
//
//  Created by 정의찬 on 11/22/23.
//

import Foundation
import SwiftUI

class DataModel: ObservableObject{
    @Published var menuPriceList = [MenuPrice(menuSize: "L", menuPrice: 1000000000),
                                    MenuPrice(menuSize: "M", menuPrice: 1111111),
                                    MenuPrice(menuSize: "S", menuPrice: 11)
    ]
    @Published var menuOption = [AddOption(name: "제로감자", price: 91200),
                                 AddOption(name: "제로치즈", price: 25400),
                                 AddOption(name: "제로돼지(100g)", price: 32000),
                                 AddOption(name: "제로피클", price: 10000)
    ]
    
    @Published var itemPriceOfSize: MenuPrice? {
        didSet {
            objectWillChange.send()
        }
    }
    
    @Published var sumMoney: Int = 0{
        didSet{
            objectWillChange.send()
        }
    }
    
    @Published var checkOption = Set<AddOption>()
    
    func addOption(option: AddOption){
        guard !checkOption.contains(option) else { return }
        checkOption.insert(option)
        sumMoney += option.price
        print(sumMoney)
    }
    
    func removeOption(option: AddOption){
        guard checkOption.contains(option) else { return }
        checkOption.remove(option)
        sumMoney -= option.price
    }
    
    func updateSumMoney() {
            sumMoney = (itemPriceOfSize?.menuPrice ?? 0) + checkOption.reduce(0) { $0 + $1.price }
        }

    
}
