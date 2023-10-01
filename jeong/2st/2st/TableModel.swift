//
//  tableModel.swift
//  2st
//
//  Created by 정의찬 on 2023/09/27.
//

import Foundation
import UIKit

public struct Item {
    var image: UIImage?
    var title: String?
    var subtitle: String?
    var price: String?
    var chat: Int?
    var heart: Int?
}

public struct Adver {
    let title: String?
    let list: [AdverList]
}

public struct AdverList{
    let image: UIImage?
    let title: String?
    let Price: String?
}

final class tableInfor {
    static let ItemList: [Item] = [
        Item(image: UIImage(named: "1.png"), title: "류현진 홈런 볼 팔아요", subtitle: "조원동", price: "10,000,000원", chat: 2, heart: 12),
        Item(image: UIImage(named: "2.png"), title: "계란후라이 할 때 쓰던 팬 팔아요", subtitle: "흑석동", price: "25,000원", chat: nil, heart: 21),
        Item(image: UIImage(named: "3.png"), title: "캐논이 아닌 디카 팜", subtitle: "영통동", price: "123,123,123,123원", chat: 1, heart: 3),
        Item(image: UIImage(named: "4.png"), title: "발냄새 좀 오지게 나는데 팔아요!!", subtitle: "청라", price: "0원", chat: 9999, heart: 999),
        Item(image: UIImage(named: "5.png"), title: "라면국물 묻은 하얀색 가방 가질분", subtitle: "제주도", price: "460,000원", chat: 100, heart: 12),
        Item(image: UIImage(named: "6.png"), title: "우리집 강아지 자랑임ㅋㅋ", subtitle: "지구 어딘가", price: "135,000원", chat: nil, heart: 12),
        Item(image: UIImage(named: "7.png"), title: "이건 모냐 조선에서 온 물건인가??", subtitle: "아 귀찮아", price: "210,000원", chat: 2, heart: nil),
        Item(image: UIImage(named: "8.png"), title: "명절인데 화투 안 하시게요??", subtitle: "어 그냥 어딘가 삼,,", price: "123원", chat: nil, heart: 14),
        Item(image: UIImage(named: "9.png"), title: "몰라료 엄청난 거 같아서 올려봐욤", subtitle: "라스베이거스", price: "131,000,000,000원", chat: nil, heart: 23),
        Item(image: UIImage(named: "10.png"), title: "갤럭시로 갈아탈라고 올림 아이폰 안씀", subtitle: "동굴석", price: "112,123원", chat: 232, heart: 213)
    ]
    
    static let adverList: [Adver] = [
        Adver(title: "멍멍멍멍 🐶🐶", list: [
            AdverList(image: UIImage(named: "6.png"), title: "멍멍", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "멍멍", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "멍멍", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "멍멍", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "멍멍", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "멍멍", Price: "1억원"),
        ]),
        
        Adver(title: "왈왈왈 🐶🐶", list: [
            AdverList(image: UIImage(named: "6.png"), title: "왈왈왈", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "왈왈왈", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "왈왈왈", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "왈왈왈", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "왈왈왈", Price: "1억원"),
            AdverList(image: UIImage(named: "6.png"), title: "왈왈왈", Price: "1억원"),
        ])
    ]
}

