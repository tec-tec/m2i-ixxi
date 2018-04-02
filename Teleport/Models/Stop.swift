//
//  Stop.swift
//  Teleport
//
//  Created by Ludovic Ollagnier on 28/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

struct Stop: Codable {

    init(name: String, latitude: Double, longitude: Double, address: String, isAvailable: Bool = true) {

        //super se refere à la classe parente
        //self au type "courant" (self == this)

        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isAvailable = isAvailable
    }

    let name: String
    let latitude: Double
    let longitude: Double
    let address: String?
    var isAvailable: Bool
}
