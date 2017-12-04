//
//  API.swift
//  Cryptocurrency
//
//  Created by Tanveer Bashir on 12/4/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

private let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/")!
class API {
    class func fetchCurrency(onSuccess: @escaping ([Currency]) -> Void,  onFailure: @escaping () -> ()) {
        Alamofire.request(url).responseArray { (response: DataResponse<[Currency]>) in
            switch response.result {
            case .success(let currencies):
                onSuccess(currencies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

