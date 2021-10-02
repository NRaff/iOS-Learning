//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateRate(_ coinManager: CoinManager, rate: RateModel)
    func didFailWithError(error:Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = Constants.key
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let requestURL = exchange(from: "BTC", to: currency)
        performRequest(with: requestURL)
    }
    
    func exchange(from: String, to: String) -> String {
        "\(baseURL)\(from)/\(to)?apikey=\(apiKey)"
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) {data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                }
                
                if let safeData = data {
                    if let exchangeRate = self.parseJSON(safeData) {
                        delegate?.didUpdateRate(self, rate: exchangeRate)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ rateData: Data) -> RateModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RateData.self, from: rateData)
            let from = decodedData.asset_id_base
            let to = decodedData.asset_id_quote
            let rate = decodedData.rate
            let timestamp = decodedData.time
            let exchangeRate = RateModel(from_asset: from, to_asset: to, rate: rate, timestamp: timestamp)
            return exchangeRate
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
