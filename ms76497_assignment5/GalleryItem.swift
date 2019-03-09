//
//  GalleryItem.swift
//  ms76497_assignment5
//
//  Created by Arvind Ramachandra on 3/6/19.
//  Copyright © 2019 Slijepcevic, Milica. All rights reserved.
//

import Foundation
import UIKit

class GalleryItem: Decodable {
    let image: UIImage?
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case label
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let imageName = try container.decode(String.self, forKey: .name)
        self.image = UIImage(named: imageName)
        
        self.label = try container.decode(String.self, forKey: .label)
    }
}


//class GalleryItem {
//    //Name Variable
//    private var _name:String
//    var name:String{
//        get {return _name}
//        set(newName) { _name = newName}
//    }
//
//    //Label Variable
//    private var _label:String
//    var label:String{
//        get {return _label}
//        set(newLabel) { _label = newLabel}
//    }
//
//
//    //Attributes of each object
//    init(name:String,label:String){
//        self._name=name
//        self._label=label
//    }
//
//}
