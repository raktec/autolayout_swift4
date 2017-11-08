//
//  swipeController.swift
//  autolayout_rakesh
//
//  Created by Rakesh Kumar Sharma on 08/11/17.
//  Copyright © 2017 Rakesh Kumar Sharma. All rights reserved.
//

import UIKit



class swipeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
    pageModel(imageName: "CocaCola", headerText: "CocaCola: A company overview", subHeaderText: "\n\n\n Coca-Cola, or Coke, is a carbonated soft drink produced by The Coca-Cola Company. Originally intended as a patent medicine."),
    pageModel(imageName: "Fanta", headerText: "Fanta: A company overview", subHeaderText: "\n\n\n Fanta is a brand of fruit-flavored carbonated soft drinks created by The Coca-Cola Company and marketed globally."),
    pageModel(imageName: "Pepsi", headerText: "Pepsi: A company overview", subHeaderText: "\n\n\n PepsiCo Inc. (PEP) is a leading food and beverage company that manufactures and distributes its products in more than 200 countries."),
    pageModel(imageName: "Sprite", headerText: "Sprite: A company overview", subHeaderText: "\n\n\n Sprite is a colorless, caffeine-free, lemon and lime-flavoured soft drink created by The Coca-Cola Company.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView?.backgroundColor = UIColor.white
        //default cell
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        //custom cell
        collectionView?.register(pageCell.self, forCellWithReuseIdentifier: "cellid")

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! pageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
}
