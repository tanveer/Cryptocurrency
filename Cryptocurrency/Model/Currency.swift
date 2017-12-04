//
//  Currency.swift
//  Cryptocurrency
//
//  Created by Tanveer Bashir on 12/4/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class Currency: Mappable {

    var id: String!
    var name: String!
    var symbol: String!
    var rank: String!
    var priceUsd: String!
    var priceBtc: String!
    var _24HVolumeUsd: String!
    var marketCapUsd: String!
    var availableSupply: String!
    var totalSupply: String!
    var maxSupply: String!
    var percentChange1h: String!
    var percentChange24h: String!
    var percentChange7d: String!
    var lastUpdated: String!

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {

        id                  <- map["id"]
        name                <- map["name"]
        symbol              <- map["symbol"]
        rank                <- map["rank"]
        priceUsd            <- map["price_usd"]
        priceBtc            <- map["price_btc"]
        _24HVolumeUsd       <- map["24h_volume_usd"]
        marketCapUsd        <- map["market_cap_usd"]
        availableSupply     <- map["available_supply"]
        totalSupply         <- map["total_supply"]
        maxSupply           <- map["max_supply"]
        percentChange1h     <- map["percent_change_1h"]
        percentChange24h    <- map["percent_change_24h"]
        percentChange7d     <- map["percent_change_7d"]
        lastUpdated         <- map["last_updated"]
    }
}
