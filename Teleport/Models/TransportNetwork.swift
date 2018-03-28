//
//  TransportNetwork.swift
//  Teleport
//
//  Created by Ludovic Ollagnier on 28/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

class TransportNetwork {

    private var lines: Set<Line>

    var allLines: [Line] {
        return lines.sorted(by: { (l1, l2) -> Bool in
            l1.number < l2.number
        })
    }

    init(demoData: Bool = false) {

        if demoData {
            lines = []
        } else {
            lines = []
        }
    }


    ///Add a new line in the network, if the line is not alerady in
    @discardableResult func insert(_ line: Line) -> Bool {
        return lines.insert(line).inserted
    }

    func remove(_ line: Line) -> Line? {
        return lines.remove(line)
    }
}

extension TransportNetwork: CustomStringConvertible {
    var description: String {
        return "Le réseau comporte \(lines.count) lignes : \(lines)"
    }
}
