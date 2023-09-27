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

    var touch : Bool = false
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        makeConstraints()
    }
    
    private func loadData(){
        let imagesNames = ["1.png", "2.png", "3.png", "4.png", "5.png","6.png","7.png","8.png","9.png","10.png"]
        let images = imagesNames.compactMap{ UIImage(named:  $0) }
        let titles: [String] = ["류현진 홈런 볼 팔아요", "계란후라이 할 때 쓰던 팬 팔아요", "캐논이 아닌 디카 팜 -> 헐값", "발냄새 좀 오지게 나는데 팔아요!!",
                                "라면국물 묻은 하얀색 가방 가질분?", "우리집 강아지 자랑임 ㅋ","이건 모냐 조선에서 온 물건인가??" ,"명절인데 화투 안 하시게요??", "몰라요 엄청난 거 같아서 올려봐욤",
                                "갤럭시로 갈아탈라고 올림 아이폰 안씀"]
        let subtitles: [String] = ["조원동", "흑석동", "영통", "청라", "제주도", "지구 어딘가", "아 귀찮아", "어 그냥 어딘가 삼", "라스베이거스", "동굴속"]
        let prices: [String] = ["10,000,000원", "20,000원", "25,000원", "123,123,123,123원", "0원", "460,000원", "135,000원", "210,000원","123원","131,000,000,000원"]
        let count = images.count
        for i in 0..<count{
            let item = Item(image: images[i], title: titles[i], subtitle: subtitles[i], price: prices[i])
            items.append(item)
        }
    }
    
    private lazy var topView : TopStatusView = {
        let view = TopStatusView()
        return view
    }()
    
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
    
    @objc private func didPullRefresh(){
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
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
        [topView, tableView ,bottomTabBar, actionBtn].forEach{ self.view.addSubview($0) }
        
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

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: CenterTableViewCell.identifier) as? CenterTableViewCell ?? CenterTableViewCell()
     cell.configuration(items[indexPath.row])
     return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

