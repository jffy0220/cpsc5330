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

    @IBAction func convertPressed(_ sender: UIButton) {
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
        performSegue(withIdentifier: "toResults", sender: value)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResults" {
            let destination = segue.destination as! ResultViewController
            let usdValue = sender as! Int

            destination.model = CurrencyModel(
                usd: usdValue,
                c1: c1Switch.isOn,
                c2: c2Switch.isOn,
                c3: c3Switch.isOn,
                c4: c4Switch.isOn
            )
        }
    }
}
