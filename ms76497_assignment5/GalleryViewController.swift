//
//  GalleryViewController.swift
//  ms76497_assignment5
//
//  Created by Arvind Ramachandra on 3/6/19.
//  Copyright © 2019 Slijepcevic, Milica. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Gallery.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCell", for: indexPath)
        return cell
    }
    

    var Gallery = [GalleryItem]()
    
    private func accessPlist() {
        let inputFile = Bundle.main.path(forResource: "Items", ofType: "plist")
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        for input in inputDataArray as! [Dictionary<String, String>] {
            Gallery.append(GalleryItem(name: input["name"] ?? "",label: input["label"] ?? ""))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        accessPlist()
        
    
}
    

    
    
    //We still need to insert code here for inputting name and image into view
    
}
//MARK: - UICollectionViewDataSource
/*
extension GalleryViewController{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}
*/
