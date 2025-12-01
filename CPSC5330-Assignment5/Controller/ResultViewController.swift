//
//  ResultViewController.swift
//  CPSC5330-Assignment5
//
//  Created by Justin Farley on 12/1/25.
//

import UIKit

class ResultViewController: UIViewController {

    var model: CurrencyModel?

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var c1Label: UILabel!
    @IBOutlet weak var c2Label: UILabel!
    @IBOutlet weak var c3Label: UILabel!
    @IBOutlet weak var c4Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let model = model else { return }

        amountLabel.text = "Amount in USD: \(model.usd)"

        let result = model.convert()

        if let v = result.c1 {
            c1Label.text = "Currency 1: \(v)"
        } else {
            c1Label.text = ""
        }

        if let v = result.c2 {
            c2Label.text = "Currency 2: \(v)"
        } else {
            c2Label.text = ""
        }

        if let v = result.c3 {
            c3Label.text = "Currency 3: \(v)"
        } else {
            c3Label.text = ""
        }

        if let v = result.c4 {
            c4Label.text = "Currency 4: \(v)"
        } else {
            c4Label.text = ""
        }
    }
}

