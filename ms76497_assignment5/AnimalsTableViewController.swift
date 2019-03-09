//
//  AnimalsTableViewController.swift
//  ms76497_assignment5
//
//  Created by Slijepcevic, Milica on 3/3/19.
//  Copyright © 2019 Slijepcevic, Milica. All rights reserved.
//

import UIKit

class AnimalsTableViewController: UITableViewController {
    var animals = [Animal]()
    
    private func accessPlist() {
        let inputFile = Bundle.main.path(forResource: "animals", ofType: "plist")
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        var size:Float
        for input in inputDataArray as! [Dictionary<String, String>] {
            size=Float(input["size"] ?? "0.0")!
            animals.append(Animal(name: input["name"] ?? "",scientific_name: input["scientific name"] ?? "",classA: input["class"] ?? "",size: size))
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        accessPlist()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animals.count*2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var number: Int
        number = indexPath.row/2
        let headline = animals[number]
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "LabelCell1", for: indexPath)
        if indexPath.row % 2 == 0 {
            cell1.textLabel?.text = headline.name
            cell1.imageView?.image = UIImage(named: headline.name)
            return cell1
        } else if indexPath.row % 2 == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "LabelCell2", for: indexPath)
            cell2.textLabel!.numberOfLines = 3
            cell2.textLabel?.text = " Scientific Name:     \(headline.scientific_name)\n                   Class:     \(headline.classA)\n                     Size:     \(headline.size)"
            return cell2
            
        }
        return cell1
    }
    
    //Segue operation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let animalVC = segue.destination as? GalleryViewController else {return}
        let indexPath = tableView.indexPathForSelectedRow
        let number = indexPath!.row/2
        animalVC.animal = animals[number]
        
    }
    

}
