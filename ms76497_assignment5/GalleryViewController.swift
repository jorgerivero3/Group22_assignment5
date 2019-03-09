//
//  GalleryViewController.swift
//  ms76497_assignment5
//
//  Created by Arvind Ramachandra on 3/6/19.
//  Copyright © 2019 Slijepcevic, Milica. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let storyboardIdentifier = "GalleryViewController"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCell", for: indexPath) as! AnimalCell
        
        let current = gallery[indexPath.row]
        
        
        cell.AnimalQuote.text = current.label
        cell.AnimalImage.image = current.image
        
        return cell
    }
    

    var gallery = [GalleryItem]()
    
    private func accessPlist() {
        
        guard let inputFile = Bundle.main.path(forResource: "Items", ofType: "plist") else {
            fatalError()
        }
        
        let url = URL(fileURLWithPath: inputFile)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = PropertyListDecoder()
            
            self.gallery = try decoder.decode([GalleryItem].self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessPlist()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
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
