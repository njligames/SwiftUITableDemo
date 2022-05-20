//
//  MenuList.swift
//  RestaurantMenu
//
//  Created by Gautham Ilango on 01/01/20.
//  Copyright © 2020 Gautham Ilango. All rights reserved.
//

import SwiftUI

struct MenuList: View {
    var body: some View {
      List(menuItems) { dish in
        MenuRow(dish: dish)
      }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
