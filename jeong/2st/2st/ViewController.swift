//
//  ViewController.swift
//  2st
//
//  Created by 정의찬 on 2023/09/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController{
    
    var saveImage : [UIImage] = []
    var TitleText : [String] = ["류현진 홈런 볼 팔아요", "계란후라이 할 때 쓰던 팬 팔아요", "캐논이 아닌 디카 팜 -> 헐값", "발냄새 좀 오지게 나는데 팔아요!!",
                                "라면국물 묻은 하얀색 가방 가질분?", "우리집 강아지 자랑임 ㅋ","이건 모냐 조선에서 온 물건인가??" ,"명절인데 화투 안 하시게요??", "몰라요 엄청난 거 같아서 올려봐욤",
                                "갤럭시로 갈아탈라고 올림 아이폰 안씀"]
    var subText : [String] = ["조원동", "흑석동", "영통", "청라", "제주도", "지구 어딘가", "아 귀찮아", "어 그냥 어딘가 삼", "라스베이거스", "동굴속"]
    var price : [String] = ["10,000,000원", "20,000원", "25,000원", "123,123,123,123원", "0원", "460,000원", "135,000원", "210,000원","123원","131,000,000,000원"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        save()
        makeConstraints()
        
    }
    
    private func save(){
        for i in 1...10 {
            if let image = UIImage(named: "\(i).png") {
                saveImage.append(image)
            } else {
                print("이미지 \(i).png를 로드할 수 없습니다.")
            }
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

    
    private func makeConstraints(){
        [topView, tableView ,bottomTabBar].forEach{ self.view.addSubview($0) }
        
        
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
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CenterTableViewCell.identifier) as? CenterTableViewCell ?? CenterTableViewCell()
        cell.configuration(leftImage: saveImage[indexPath.row], titleTxt: TitleText[indexPath.row], subTxt: subText[indexPath.row], priceTxt: price[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}


