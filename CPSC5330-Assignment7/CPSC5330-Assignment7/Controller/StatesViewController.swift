//
//  StatesViewController.swift
//  CPSC5330-Assignment7
//
//  Created by Justin Farley on 12/6/25.
//


import UIKit

class StatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let states: [State] = [
        State(name: "California",
              colleges: ["UCLA", "UC Berkeley", "Stanford", "USC", "UC San Diego"]),
        
        State(name: "Texas",
              colleges: ["University of Texas Austin", "Texas A&M", "Rice University", "Texas Tech", "Baylor"]),
        
        State(name: "New York",
              colleges: ["Columbia University", "NYU", "Cornell University", "RIT", "University at Buffalo"]),
        
        State(name: "Florida",
              colleges: ["University of Florida", "FSU", "UCF", "University of Miami", "USF"]),
        
        State(name: "Illinois",
              colleges: ["University of Illinois Urbana-Champaign", "Northwestern", "UIC", "Illinois State", "Loyola Chicago"]),
        
        State(name: "Georgia",
              colleges: ["University of Georgia", "Georgia Tech", "Georgia State", "Emory University"]),
        
        State(name: "North Carolina",
              colleges: ["UNC Chapel Hill", "Duke University", "NC State", "Wake Forest"]),
        
        State(name: "Ohio",
              colleges: ["Ohio State University", "Case Western Reserve", "University of Cincinnati", "Miami University"]),
        
        State(name: "Pennsylvania",
              colleges: ["UPenn", "Penn State", "Carnegie Mellon", "Temple University"]),
        
        State(name: "Michigan",
              colleges: ["University of Michigan", "Michigan State", "Wayne State", "Michigan Tech"]),
        
        State(name: "Alabama",
              colleges: ["University of Alabama", "Auburn University", "North Alabama", "Jacksonville State"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "States"
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        cell.textLabel?.text = states[indexPath.row].name
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showColleges" {
            if let destination = segue.destination as? CollegesViewController,
               let indexPath = tableView.indexPathForSelectedRow {

                destination.state = states[indexPath.row]
            }
        }
    }
}
