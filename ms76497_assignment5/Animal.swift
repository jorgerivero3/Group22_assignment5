//
//  Animals.swift
//  ms76497_assignment5
//
//  Created by Slijepcevic, Milica on 3/3/19.
//  Copyright © 2019 Slijepcevic, Milica. All rights reserved.
//

import Foundation
//Animal object class
class Animal {
    //Name Variable
    private var _name:String
    var name:String{
        get {return _name}
        set(newName) { _name = newName}
    }
    
    //Scientific Name Variable
    private var _scientific_name:String
    var scientific_name:String{
        get {return _scientific_name}
        set(newSName) { _scientific_name = newSName}
    }
    
    //Class Variable
    private var _classA:String
    var classA:String{
        get {return _classA}
        set(newClass) { _classA = newClass}
    }
    
    //Size Variable
    private var _size:Float
    var size:Float{
        get {return _size}
        set(newSize) { _size = newSize}
    }
    
    //Attributes of each object
    init(name:String,scientific_name:String, classA:String, size:Float){
        self._name=name
        self._scientific_name=scientific_name
        self._classA=classA
        self._size=size
    }
    
}
