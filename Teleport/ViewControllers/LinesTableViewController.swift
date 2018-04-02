//
//  LinesTableViewController.swift
//  Teleport
//
//  Created by Ludovic Ollagnier on 29/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

import UIKit

class LinesTableViewController: UITableViewController {

    var network = TransportNetwork(demoData: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        let data = network.jsonValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return network.allLines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "lineCell", for: indexPath)

        // Configure the cell...

        let line = network.allLines[indexPath.row]

        cell.textLabel?.text = line.name

        if let start = line.startOfLineStop, let end = line.endOfLineStop {
            cell.detailTextLabel?.text = "Départ de " + start.name + " à " + end.name
        } else {
            cell.detailTextLabel?.text = "Ligne sans arrêts"
        }

        cell.imageView?.image = UIImage(named: line.kind.imageName)

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section header"
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "goStops" {

            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let line = network.allLines[indexPath.row]

            guard let destination = segue.destination as? StopsViewController else { return }
            destination.currentLine = line

        }
    }

}
