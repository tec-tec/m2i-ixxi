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

            var tramA = Line(number: 1, name: "Tram A", stops: [], length: 0, kind: .tram(capacity: 300))
            let arret1 = Stop(name: "Les Pins", latitude: 0.0, longitude: 0.0, address: "")
            let arret2 = Stop(name: "Frères Robinson", latitude: 0.0, longitude: 0.0, address: "")
            let arret3 = Stop(name: "Hotel de ville Mérignac", latitude: 0.0, longitude: 0.0, address: "")
            let arret4 = Stop(name: "Pin Galant", latitude: 0.0, longitude: 0.0, address: "")
            let arret5 = Stop(name: "Mérignac Centre", latitude: 0.0, longitude: 0.0, address: "")

            tramA.stops = [arret1, arret2, arret3, arret4, arret5]

            var bus1 = Line(number: 2, name: "Ligne 1", stops: [], length: 0, kind: .bus(capacity: 66))
            let arret1a = Stop(name: "Mérignac Aéroport", latitude: 0.0, longitude: 0.0, address: "")
            let arret2a = Stop(name: "Météo France", latitude: 0.0, longitude: 0.0, address: "")
            let arret3a = Stop(name: "Lindbergh", latitude: 0.0, longitude: 0.0, address: "")
            let arret4a = Stop(name: "Acacias", latitude: 0.0, longitude: 0.0, address: "")
            let arret5a = Stop(name: "Mérignac Centre", latitude: 0.0, longitude: 0.0, address: "")

            bus1.stops = [arret1a, arret2a, arret3a, arret4a, arret5a]

            var bus2 = Line(number: 3, name: "Métro en projet", stops: [], length: 0, kind: .metro(capacity: 66))

            lines = [tramA, bus1 , bus2]


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
