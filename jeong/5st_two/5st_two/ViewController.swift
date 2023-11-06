//
//  ViewController.swift
//  5st_two
//
//  Created by 정의찬 on 11/6/23.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    let fetchWeatherData = FetchWeather()
    
    private lazy var weatherText: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20)
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var textInput: UITextField = {
        let text = UITextField()
        text.placeholder = "지역 입력 ㄱㄱ"
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 2
        text.layer.borderColor = UIColor.black.cgColor
        text.font = UIFont.systemFont(ofSize: 13)
        text.returnKeyType = .search
        text.leftViewMode = .always
        text.delegate = self
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        makeconstraints()
    }
    
    //MARK: - Function
    
    private func makeconstraints(){
        self.view.addSubview(weatherText)
        self.view.addSubview(textInput)
        
        
        textInput.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130)
            make.width.equalTo(130)
            make.height.equalTo(30)
            
        }
        
        weatherText.snp.makeConstraints{ make in
            make.top.equalTo(textInput.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.width.lessThanOrEqualTo(400)
        }
    }
    
    private func fetchData(_ cityName: String){
        fetchWeatherData.weatherData(cityName: cityName) { [weak self] weather, error in
            guard let self = self else { return }
            
            guard let weather = weather else {
                if error != nil {
                    print("no error")
                }
                return
            }
            self.weatherText.text = """
             도시 : \(weather.name) \n 온도 : \(String(format: "%.1f", weather.main.temp - 273.15))°C \n 습도: \(weather.main.humidity) \n
            구름 : \(weather.clouds.all) \n 바람속도 : \(weather.wind.speed)
            """
        }
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            var text = textField.text
            text?.removeAll(where: {$0 == " " })
            fetchData(text ?? "")
        }
        textField.resignFirstResponder()
        return true
    }
}

