//
//  Dish.swift
//  RestaurantMenu
//
//  Created by Gautham Ilango on 01/01/20.
//  Copyright © 2020 Gautham Ilango. All rights reserved.
//

import Foundation
import SwiftUI

struct Dish: Codable, Hashable, Identifiable {
  var id: Int
  var name: String
  var cuisine: String
  var price: Int
  var imageName: String
}

extension Dish {
    var image: Image {
        RestaurantImageStore.shared.image(name: imageName)
    }
}
