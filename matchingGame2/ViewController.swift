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
    var intPicked = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
    var twoIntPicked = [Int]()
    
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
                twoIntPicked.append(indexPath.row + 1)
                
                if(x == 2 ){
                    print("second choice")
                  print(twoPicked)
                    if(twoPicked[0] == twoPicked[1]){
                        print(twoPicked)
                        
                        print("match")
                        x = 0
                        for i in (0...twoPicked.count-1).reversed(){
                            twoPicked.remove(at: i)
                        }
                        for i in (0...twoIntPicked.count-1).reversed(){
                            twoIntPicked.remove(at: i)
                        }
                    }
                    
                    else{
                        
                        
                        for i in (0...twoPicked.count-1).reversed(){
                            twoPicked.remove(at: i)
                        }
                        for i in (0...twoIntPicked.count-1).reversed(){
                            twoIntPicked.remove(at: i)
                        }
                      
                        print("\(twoPicked) is so cool")
                        
                    }
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
