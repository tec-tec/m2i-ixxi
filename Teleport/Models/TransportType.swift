//
//  TransportType.swift
//  Teleport
//
//  Created by Ludovic Ollagnier on 28/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

enum TransportType {
    case bus(capacity: Int)
    case tram(capacity: Int)
    case metro(capacity: Int)
    case train(capacity: Int)

    init?(type: String, capacity: Int) {

        guard capacity > 0 else { return nil }
        guard capacity < 1000 else { return nil }

        switch type {
        case "Bus":
            self = TransportType.bus(capacity: capacity)
        case "Tram":
            self = TransportType.tram(capacity: capacity)
        case "Métro":
            self = TransportType.metro(capacity: capacity)
        case "Train":
            self = TransportType.train(capacity: capacity)
        default:
            return nil
        }
    }

    static var allTypes: [TransportType] {
        return [self.bus(capacity: 0), self.tram(capacity: 0), self.metro(capacity: 0), self.train(capacity: 0)]
    }

    var stringValue: String {
        switch self {
        case .bus:
            return "Bus"
        case .tram:
            return "Tram"
        case .metro:
            return "Métro"
        case .train:
            return "Train"
        }
    }

    var imageName: String {
        switch self {
        case .bus:
            return "bus"
        case .tram:
            return "tram"
        case .metro:
            return "metro"
        case .train:
            return "train"
        }
    }
}
