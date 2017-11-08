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
    
    
    
    let previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector(prevHandler), for:.touchUpInside)
        
        
        return button
    }()
    
    let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector(nextHandler), for:.touchUpInside)

        
        return button
    }()
    
     lazy var pageController:UIPageControl = {
        let  pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }()
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageController.currentPage = Int(x/view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView?.backgroundColor = UIColor.white
       
        collectionView?.register(pageCell.self, forCellWithReuseIdentifier: "cellid")
        setupBottonControl()

    }
    
    @objc func prevHandler(){
    print("Prev")
    
        let prevIndex = max(pageController.currentPage - 1 ,0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageController.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    @objc func nextHandler(){
        print("Next")
        let nextIndex = min(pageController.currentPage+1 ,pages.count-1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageController.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        

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
    
    func setupBottonControl(){
       
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton,pageController,nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        view.addSubview(bottomControlStackView)
        
        // no need every time add .isActive
        NSLayoutConstraint.activate([
            
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            
            
            ])
    }
        
}
