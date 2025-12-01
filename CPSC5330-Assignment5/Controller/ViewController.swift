//
//  ViewController.swift
//  CPSC5330-Assignment5
//
//  Created by Justin Farley on 12/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    @IBOutlet weak var c1Switch: UISwitch!
    @IBOutlet weak var c2Switch: UISwitch!
    @IBOutlet weak var c3Switch: UISwitch!
    @IBOutlet weak var c4Switch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let text = usdTextField.text,
              let value = Int(text) else {
            errorLabel.text = "Invalid input. Enter integers only."
            return
        }

        if !(c1Switch.isOn || c2Switch.isOn || c3Switch.isOn || c4Switch.isOn) {
            errorLabel.text = "Select at least one currency."
            return
        }

        errorLabel.text = ""

        let model = CurrencyModel(
            usd: value,
            useC1: c1Switch.isOn,
            useC2: c2Switch.isOn,
            useC3: c3Switch.isOn,
            useC4: c4Switch.isOn
        )

        performSegue(withIdentifier: "showResults", sender: model)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults",
           let dest = segue.destination as? ResultViewController,
           let model = sender as? CurrencyModel {

            dest.model = model
        }
    }
}


