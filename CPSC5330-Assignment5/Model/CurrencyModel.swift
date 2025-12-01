//
//  CurrencyModel.swift
//  CPSC5330-Assignment5
//
//  Created by Justin Farley on 12/1/25.
//

import Foundation

struct CurrencyModel {
    let usd: Int
    let useC1: Bool
    let useC2: Bool
    let useC3: Bool
    let useC4: Bool

    // Fixed example rates
    private let rateC1 = 0.90
    private let rateC2 = 150.0
    private let rateC3 = 1.35
    private let rateC4 = 0.75

    func convert()
        -> (c1: Double?, c2: Double?, c3: Double?, c4: Double?) {

        return (
            useC1 ? Double(usd) * rateC1 : nil,
            useC2 ? Double(usd) * rateC2 : nil,
            useC3 ? Double(usd) * rateC3 : nil,
            useC4 ? Double(usd) * rateC4 : nil
        )
    }
}
