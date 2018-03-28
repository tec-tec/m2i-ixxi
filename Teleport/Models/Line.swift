//
//  Line.swift
//  Teleport
//
//  Created by Ludovic Ollagnier on 28/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

struct Line {

    let number: Int
    let name: String
    var stops: [Stop]

    var startOfLineStop: Optional<Stop> {
        return stops.first
    }
    var endOfLineStop: Stop? {
        return stops.last
    }

    var length: Float
    let kind: TransportType
}

extension Line: Hashable {

    var hashValue: Int {
        return number.hashValue ^ name.hashValue
    }

    static func == (lhs: Line, rhs: Line) -> Bool {
        if lhs.number == rhs.number && lhs.name == rhs.name {
            return true
        }
        return false
    }
}
