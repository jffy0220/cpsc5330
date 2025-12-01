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

        let results = model.convert()

        c1Label.text = model.c1 ? "Currency 1: \(results.0!)" : ""
        c2Label.text = model.c2 ? "Currency 2: \(results.1!)" : ""
        c3Label.text = model.c3 ? "Currency 3: \(results.2!)" : ""
        c4Label.text = model.c4 ? "Currency 4: \(results.3!)" : ""
    }
}
