//
//  FetchWeatherData.swift
//  5st_two
//
//  Created by 정의찬 on 11/6/23.
//

import Foundation
import Alamofire

struct FetchWeather{
    private let APIKey = "328c3a329dbfd1cc1932125bbb921d5a"
    func weatherData(cityName: String, completionHandler: @escaping (WeatherData?, AFError?) -> Void) {
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(APIKey)"
        DispatchQueue.global().async{
            AF
                .request(weatherURL)
                .responseDecodable(of:WeatherData.self) { response in
                    switch response.result {
                    case .success(let data):
                        DispatchQueue.main.async{
                            completionHandler(data, nil)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async{
                            completionHandler(nil, error)
                        }
                        print(error.localizedDescription, "error")
                    }
                }
        }
        
    }
}q
