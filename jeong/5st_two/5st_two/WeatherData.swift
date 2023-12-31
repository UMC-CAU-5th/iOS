//
//  model.swift
//  5st_two
//
//  Created by 정의찬 on 11/6/23.
//

import Foundation

struct WeatherData: Codable{
    
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
    struct Coord: Codable{
        let lon: Double
        let lat: Double
    }
    
    struct Weather: Codable{
        let id : Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Main: Codable{
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
    }
    
    struct Wind: Codable{
        let speed: Double
        let deg: Int
        let gust: Double
    }
    
    struct Clouds: Codable{
        let all: Int
    }
    
    struct Sys: Codable{
        let country: String
        let sunrise: Int
        let sunset: Int
    }
}
