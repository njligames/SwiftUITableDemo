//
//  API.swift
//  RestaurantMenu
//
//  Created by Gautham Ilango on 01/01/20.
//  Copyright © 2020 Gautham Ilango. All rights reserved.
//

import UIKit
import SwiftUI

let menuItems: [Dish] = processJSONData(filename: "menuData.json")

private func processJSONData<T: Decodable>(filename: String) -> T {
  let data: Data
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
      else {
          fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  do {
      data = try Data(contentsOf: file)
  } catch {
      fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
  } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}

final class RestaurantImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = RestaurantImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(RestaurantImageStore.scale), label: Text(verbatim: name))
    }

    static func loadPNGImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).png from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = RestaurantImageStore.loadPNGImage(name: name)
        return images.index(forKey: name)!
    }
}
