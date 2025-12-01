//
//  model.swift
//  CPSC5330-Assignment5
//
//  Created by Justin Farley on 11/23/25.
//

import Foundation

struct CurrencyModel {
    let usd: Int
    let c1: Bool
    let c2: Bool
    let c3: Bool
    let c4: Bool
    
    let rateC1 = 0.90
    let rateC2 = 150.0
    let rateC3 = 1.35
    let rateC4 = 0.75
    
    func convert() -> (Double?, Double?, Double?, Double?) {
        return (
                c1 ? Double(usd) * rateC1 : nil,
                c2 ? Double(usd) * rateC2 : nil,
                c3 ? Double(usd) * rateC3 : nil,
                c4 ? Double(usd) * rateC4 : nil
        )
    }
}
