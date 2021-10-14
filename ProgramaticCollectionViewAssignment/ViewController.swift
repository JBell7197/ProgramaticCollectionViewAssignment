//
//  ViewController.swift
//  ProgramaticCollectionViewAssignment
//
//  Created by Justin Bell on 10/13/21.
//

import UIKit

let cellIdentifier = "myCustomCollectionView"
class ViewController: UIViewController, UICollectionViewDataSource {
   
    var itemToLoad : [String] = ["One", "Two", "Three", "Four", "Five"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        let myCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        myCollectionView.dataSource = self
        
        //add collectionview as a subview on view
        self.view.addSubview(myCollectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemToLoad.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as UICollectionViewCell
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        
        title.text = self.itemToLoad[indexPath.row]
        title.textAlignment = .center
        title.textColor = .white
        
        cell.backgroundColor = self.randomColor()
        cell.contentView.addSubview(title)
        
        return cell
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

