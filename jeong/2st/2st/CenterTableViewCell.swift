//
//  CenterTableView.swift
//  2st
//
//  Created by 정의찬 on 2023/09/27.
//

import UIKit
import SnapKit

class CenterTableViewCell: UITableViewCell {
    
    static let identifier = "CenterTableViewCell"
    
    private var adverList: [AdverList] = []
    
    /// MARK: 아이템
    private lazy var tableImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        
        return image
    }()
    
    /// MARK: 게시글 제목
    private lazy var titleText: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        text.numberOfLines = 0
        text.lineBreakMode = .byCharWrapping
        return text
    }()
    
    /// MARK: 동네 이름
    private lazy var subTitleText: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        text.textColor = UIColor.gray
        return text
    }()
    
    /// MARK: 가격
    private lazy var price: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return text
    }()
    
    /// MARK: 채팅넘버
    private lazy var chatNum: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    /// MARK: 채팅 이미지
    private lazy var chatImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "message")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        return view
    }()
    
    /// MARK: 하트넘버
    private lazy var heartNum: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    //// MARk: 하트 이미지
    private lazy var heartImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "heart")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        return view
    }()
    
    private lazy var rightStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 6
        return view
    }()
    
    /// MARK: 광고 제목
    private lazy var adverTitleText: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        text.numberOfLines = 0
        text.lineBreakMode = .byCharWrapping
        return text
    }()
    
    /// MARK: 가로 스크롤
    private lazy var adverCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder : NSCoder) {
        fatalError("error")
    }
    
    // MARK: - Constraints
    
    private func productMakeConstraints() {
        tableImage.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self.safeAreaLayoutGuide).offset(12)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(12)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-12)
            make.width.lessThanOrEqualTo(120)
        }
        
        titleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(12)
            make.left.equalTo(tableImage.snp.right).offset(12)
            make.right.equalTo(self.safeAreaLayoutGuide).offset(-40)
        }
        
        subTitleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(titleText.snp.bottom).offset(12)
            make.left.equalTo(tableImage.snp.right).offset(12)
        }
        
        price.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(subTitleText.snp.bottom).offset(12)
            make.left.equalTo(tableImage.snp.right).offset(12)
        }
        
        rightStack.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func adverMakeConstraints(){
        adverTitleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.width.greaterThanOrEqualTo(60)
        }
        
        adverCollectionView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(adverTitleText.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(180)
        }
    }
    
    // MARK: - Function
    
    private func adverView(){
        [tableImage, titleText, subTitleText, price, rightStack].forEach{ $0.removeFromSuperview() }
        [adverTitleText, adverCollectionView].forEach{ self.addSubview($0) }
    
        adverCollectionView.dataSource = self
        adverCollectionView.delegate = self
        adverCollectionView.register(AdverCollectionViewCell.self, forCellWithReuseIdentifier: AdverCollectionViewCell.identifier)
        
        adverMakeConstraints()
    }
    
    private func productView(){
        [adverTitleText, adverCollectionView].forEach{ $0.removeFromSuperview() }
        [tableImage, titleText, subTitleText, price, rightStack].forEach{ self.addSubview($0) }
        
        productMakeConstraints()
    }
    
    public func productConfiguration(_ model : Item) {
        productView()
        
        tableImage.image = model.image
        titleText.text = model.title
        subTitleText.text = model.subtitle
        price.text = model.price
        
        if (model.chat ?? 0) != 0{
            rightStack.addArrangedSubview(chatImage)
            rightStack.addArrangedSubview(chatNum)
            chatNum.text = "\(model.chat ?? 0)"
        }
        
        if (model.heart ?? 0) != 0{
            rightStack.addArrangedSubview(heartImage)
            rightStack.addArrangedSubview(heartNum)
            heartNum.text = "\(model.heart ?? 0)"
        }
    }
    
    public func adverConfiguration(adver: Adver){
        adverList = adver.list
        adverView()
        adverCollectionView.reloadData()
        titleText.text = adver.title ?? ""
    }

}


extension CenterTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adverList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdverCollectionViewCell.identifier, for: indexPath) as? AdverCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.makeData(adver: adverList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
}

