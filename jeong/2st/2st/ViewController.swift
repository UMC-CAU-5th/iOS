//
//  ViewController.swift
//  2st
//
//  Created by 정의찬 on 2023/09/25.
//

import UIKit
import SnapKit
import JJFloatingActionButton

class ViewController: UIViewController{

    private var touch : Bool = false
    private var items: [Item] = []
    private var randomIdx: [Int] = []
    private var adsIdx: Int = 0
    private var ProductIdx: Int = 0
    
    ///MARK: 상단 뷰
    private lazy var topView : TopStatusView = {
        let view = TopStatusView()
        return view
    }()
    
    ///MARK: 하단 탭
    private lazy var bottomTabBar : BottomTabBar = {
        let tab = BottomTabBar()
        
        let tabAppear = UITabBarAppearance()
        tabAppear.stackedLayoutAppearance.selected.iconColor = UIColor.orange
        tabAppear.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        tabAppear.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.orange
        tabAppear.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.orange
        
        tab.standardAppearance = tabAppear
        tab.backgroundColor = .white
        return tab
    }()
    
    ///MARK: 테이블 뷰
    private lazy var tableView : UITableView = {
        let table = UITableView()
        table.register(CenterTableViewCell.self, forCellReuseIdentifier: CenterTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.refreshControl = UIRefreshControl()
        table.refreshControl?.tintColor = UIColor.orange
        table.refreshControl?.addTarget(self, action: #selector(didPullRefresh), for: .valueChanged)
        return table
    }()
    
    private lazy var actionBtn : JJFloatingActionButton = {
        let btn = JJFloatingActionButton()
    
        btn.buttonImage = UIImage(systemName: "plus")
        btn.buttonColor = UIColor.orange
        btn.buttonDiameter = 60
        btn.buttonImageSize = CGSize(width: 30, height: 30)
        
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowOpacity = 0.4
        btn.layer.shadowRadius = 2
        btn.itemAnimationConfiguration = .slideIn(withInterItemSpacing: 10)
        
        btn.configureDefaultItem{ item in
            item.titlePosition = .leading
            item.titleLabel.textColor = .black
            item.titleLabel.backgroundColor = .white
            item.titleLabel.textAlignment = .center
            item.titleLabel.layer.cornerRadius = 5
            item.titleLabel.layer.masksToBounds = true
            item.titleLabel.snp.makeConstraints{ (make) -> Void in
                make.width.greaterThanOrEqualTo(70)
                make.width.greaterThanOrEqualTo(20)
            }
            item.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            item.buttonImageColor = .orange
        }
        
        btn.addItem(title: "부동산", image: UIImage(systemName: "house.and.flag")?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal))
        btn.addItem(title: "중고차", image: UIImage(systemName: "car.fill")?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal))
        btn.addItem(title: "농수산물", image: UIImage(systemName: "camera.macro.circle")?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal))
        btn.addItem(title: "과외", image: UIImage(systemName: "book.fill")?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal))
        
        btn.addTarget(self, action: #selector(handleButtonTouchUp), for: .touchUpInside)
        
        return btn
                                                    
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        randomAdver()
        makeConstraints()
    }
    
    //MARK: - function
    
    private func randomAdver(){
        var randomIdx: [Int] = []
        let all = tableInfor.ItemList.count + tableInfor.adverList.count
        
        while randomIdx.count != tableInfor.adverList.count{
            let num = Int.random(in: 0..<all)
            let overLapNumber = randomIdx.filter{num == $0}
            
            if (overLapNumber.first ?? -1) != num {
                randomIdx.append(num)
            }
        }
        self.randomIdx = randomIdx
    }
    
    
    @objc private func didPullRefresh(){
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    @objc private func handleButtonTouchUp(){
        if touch == false{
            actionBtn.buttonColor = .white
            actionBtn.buttonImageColor = .black
            touch = true
        }
        else{
            actionBtn.buttonColor = .orange
            actionBtn.buttonImageColor = .white
            touch = false
        }
    }
    
    private func makeConstraints(){
        [topView, tableView, bottomTabBar, actionBtn].forEach{ self.view.addSubview($0) }
        
        topView.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ (make) -> Void in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-50)
        }
        
        bottomTabBar.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(tableView.snp.bottom).offset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        actionBtn.snp.makeConstraints{ (make) -> Void in
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.bottom.equalTo(bottomTabBar.snp.top).offset(-20)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableInfor.ItemList.count + tableInfor.adverList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CenterTableViewCell.identifier, for: indexPath) as? CenterTableViewCell else{
            return UITableViewCell()
        }
        
        var check: Bool = true
        let _ = randomIdx.filter{$0 == indexPath.row}.map{_ in
            check = false
            cell.adverConfiguration(adver: tableInfor.adverList[adsIdx])
            if adsIdx < (tableInfor.adverList.count - 1){
                adsIdx += 1
            }
            else{
                adsIdx = 0
            }
        }
        
        if check{
            cell.productConfiguration(tableInfor.ItemList[ProductIdx])
            if ProductIdx < (tableInfor.ItemList.count - 1){
                ProductIdx += 1
            }
            else{
                ProductIdx = 0
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var notAdver = true
        let height = randomIdx.filter{ $0 == indexPath.row}.map{_ in
            notAdver = false
            return 200
        }
        
        if notAdver {
            return 150
        }
        else{
            return CGFloat(height.first ?? 0)
        }
    }
}
