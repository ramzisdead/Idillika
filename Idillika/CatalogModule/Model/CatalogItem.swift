//
//  Catalog.swift
//  Idillika
//
//  Created by Рамазан on 28.07.2020.
//  Copyright © 2020 Рамазан. All rights reserved.
//

import Foundation


struct CatalogItem: Codable{
    var id: Int?
    var imageLink: String?
    var title: String?
    var price: Int?
    var available: Bool?
    var favorite: Bool?
    var brand: String?
    
}
