//
//  RateModel.swift
//  ByteCoin
//
//  Created by Nick Raff on 10/2/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct RateModel {
    let from_asset: String
    let to_asset: String
    let rate: Double
    let timestamp: String
    
    var rateString: String {
        String(format: "%.02f", rate)
    }
}
