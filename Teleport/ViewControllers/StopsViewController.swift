//
//  StopsTableViewController.swift
//  Teleport
//
//  Created by Ludovic Ollagnier on 29/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController {

    var currentLine: Line!

    override func viewDidLoad() {
        super.viewDidLoad()

        if currentLine == nil { fatalError() }
        title = currentLine.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension StopsViewController: UITableViewDataSource {
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentLine.stops.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopCell", for: indexPath)

        let currentStop = currentLine.stops[indexPath.row]

        cell.textLabel?.text = currentStop.name
        cell.detailTextLabel?.text = currentStop.address

        return cell
    }
}
