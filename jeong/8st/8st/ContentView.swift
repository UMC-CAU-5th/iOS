//
//  ContentView.swift
//  8st
//
//  Created by 정의찬 on 11/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataModel = DataModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                
                TopPrice(priceList: $dataModel.menuPriceList, dataModel: dataModel, selectedPrice: dataModel.itemPriceOfSize)
                    .frame(minHeight: 200)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .font(.system(size: 20).bold())
                
                Spacer().frame(height: 100)
                
                BottomOption(selectedOptionList: $dataModel.menuOption, selectedOption: dataModel.checkOption, dataModel: dataModel)
                    .frame(minHeight: 200)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .font(.system(size: 20).bold())
            }
        }
    }
}
    
    /*
     #Preview {
     ContentView()
     }
     */
