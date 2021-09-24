//
//  WeatherModel.swift
//  Clima
//
//  Created by Nick Raff on 9/14/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temp : Double
    
    var temperatureString: String {
        String(format: "%.1f", temp)
    }
    
    var conditionName: String {
        switch true {
        case conditionId < 300:
            return "cloud.bolt.rain"
        case conditionId < 500:
            return "cloud.drizzle"
        case conditionId < 700:
            return "cloud.snow"
        case conditionId < 800:
            return "cloud.fog"
        case conditionId == 800:
            return "sun.max"
        default:
            return "cloud"
        }
    }
}
