//
//  ViewController.swift
//  Teleport
//
//  Created by Ludovic Ollagnier on 27/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var lineNameTextField: UITextField!
    @IBOutlet weak var lineNumberTextField: UITextField!
    @IBOutlet weak var addStopButton: UIButton!
    @IBOutlet weak var capacityTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    //MARK: - Public vars

    //MARK: - Private vars
    private var network = TransportNetwork()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()

        let session = URLSession.shared
        let url = URL(string: "https://www.apple.com/v/home/do/images/heroes/iphone-x/iphone_x_large_2x.jpg")!
        let task = session.dataTask(with: url) { (data, response, error) in

            if error != nil {
                return
            }

            if let data = data, let image = UIImage(data: data) {

                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }

        }
        task.resume()

    }

    //MARK: - Actions

    @IBAction func cancel(_ sender: Any) {

        dismiss(animated: true) {
            
            print("Dismissed")
        }
    }

    @IBAction func save(_ sender: Any) {

        guard let capacityString = capacityTextField.text, let capacity = Int(capacityString) else { return }
        let index = typeSegmentedControl.selectedSegmentIndex
        guard let typeString = typeSegmentedControl.titleForSegment(at: index) else { return }
        guard let type = TransportType(type: typeString, capacity: capacity) else { return }

        guard let lineNumberString = lineNumberTextField.text, let lineNumber = Int(lineNumberString) else { return }
        guard let lineName = lineNameTextField.text, lineName.count > 0 else { return }

        let newLine = Line(number: lineNumber, name: lineName, stops: [], length: 0, kind: type)
        network.insert(newLine)

        print(network)
    }

    @IBAction func addStop(_ sender: Any) {
    }

    //MARK: - Public methods

    //MARK: - Private methods

    private func configureUI() {

//        addStopButton.isEnabled = false
        configureSegmentedControl()

        navigationController?.navigationBar.barTintColor = .yellow
    }

    private func configureSegmentedControl() {
        typeSegmentedControl.removeAllSegments()
        for type in TransportType.allTypes {
            typeSegmentedControl.insertSegment(withTitle: type.stringValue, at: typeSegmentedControl.numberOfSegments, animated: false)

        }
        typeSegmentedControl.selectedSegmentIndex = 0
    }

}

