//
//  CollegesViewController.swift
//  CPSC5330-Assignment7
//
//  Created by Justin Farley on 12/6/25.
//


import UIKit

class CollegesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var state: State?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = state?.name ?? "Colleges"

        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state?.colleges.count ?? 0
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell", for: indexPath)
        cell.textLabel?.text = state?.colleges[indexPath.row]
        return cell
    }
}
