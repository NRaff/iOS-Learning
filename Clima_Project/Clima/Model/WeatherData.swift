//
//  WeatherData.swift
//  Clima
//
//  Created by Nick Raff on 9/14/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let visibility: Int
    let main: TemperatureInfo
    let weather: [WeatherConditions]
}

struct TemperatureInfo: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct WeatherConditions: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
