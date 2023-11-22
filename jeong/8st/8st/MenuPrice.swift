//
//  MenuPrice.swift
//  8st
//
//  Created by 정의찬 on 11/22/23.
//

import Foundation

struct MenuPrice: Identifiable, Hashable {
    var id = UUID()
    let menuSize: String
    let menuPrice: Int
}
