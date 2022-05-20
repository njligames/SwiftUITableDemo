//
//  MenuRow.swift
//  RestaurantMenu
//
//  Created by Gautham Ilango on 01/01/20.
//  Copyright © 2020 Gautham Ilango. All rights reserved.
//

import SwiftUI

struct MenuRow: View {
  var dish: Dish
    var body: some View {
        HStack {
            dish.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: dish.name)
            Spacer()
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
      MenuRow(dish: menuItems[0])
    }
}
