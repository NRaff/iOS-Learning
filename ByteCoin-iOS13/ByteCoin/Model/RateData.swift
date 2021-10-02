//
//  RateData.swift
//  ByteCoin
//
//  Created by Nick Raff on 10/2/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Rate: Encodable {
    let time: Date
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
