//
//  Location.swift
//  ToDoApp
//
//  Created by Admin on 23/04/2019.
//  Copyright © 2019 Admins. All rights reserved.
//

import Foundation
import CoreLocation

struct Location  {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location    )
}
