//
//  ViewController.swift
//  matchingGame2
//
//  Created by MYKAELA WALLEN on 12/5/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

 
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    var x = 0 
    var colors = [UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal, UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal    ]
    
    var twoPicked = [UIColor]()
    
    override func viewDidLoad() {
        
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        18
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.purple
  
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        x+=1
        if(x == 1 || x == 2){
            
            if let clicked = collectionView.cellForItem(at: indexPath){
          
                clicked.backgroundColor = colors[indexPath.row]
        
                twoPicked.append(colors[indexPath.row])
                
                if(twoPicked[0] == twoPicked[1]){
                    
                }
            }
            
        }
        
        if(x == 3){
            x = 0
            collectionViewOutlet.reloadData()
            
            if let clicked = collectionView.cellForItem(at: indexPath){
          
                clicked.backgroundColor = colors[indexPath.row]
        
               
            }
        }
        
       
        
        
 
    }
    



}
