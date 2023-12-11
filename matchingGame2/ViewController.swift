//
//  ViewController.swift
//  matchingGame2
//
//  Created by MYKAELA WALLEN on 12/5/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

 
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    var c = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    var c2 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    var c3 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    var s = 0
    var x = 0
    var r = 0
    var w = 0
    var colors = [UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal, UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal    ]
    
    var twoPicked = [UIColor]()
    var intPicked = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
    var twoIntPicked = [Int]()
    
    override func viewDidLoad() {
        
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("printing collection view")
        return intPicked.count
      
        
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
                
                twoIntPicked.append(indexPath.row )
                
                if(x == 2 ){
                    print("second choice")
                
                    
                    if(twoPicked[0] == twoPicked[1]){
                        print("match")
                        s += 2
                        scoreLabel.text = "Score : \(s) "
                        print(intPicked.count)
                        
                        
                        for i in (0 ... 1).reversed(){
                            print("removing first and second")
                            intPicked.remove(at: i)
                                
                            }

                        
                        if(intPicked.count == 0 ){
                            collectionView.reloadData()
                            w += 1
                            winLabel.text = "Wins : \(w)"
                            if(r == 0 ){
                                //1 create Alert controller
                                let alert = UIAlertController(title: "CONGRATS", message: "YOU WON!!!!", preferredStyle: .alert)
                                
                                //2 create action
                                let okAction = UIAlertAction(title: "WOOHOO!!!", style: .default)
                                let round2 = UIAlertAction(title: "Round 2", style: .default) { UIAlertAction in
                                    
                                    self.colors = [UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal, UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal  ]
                                    
                                    self.colors.append(self.c)
                                    self.colors.append(self.c)
                                    self.colors.append(self.c3)
                                    self.colors.append(self.c3)
                                    self.colors.append(self.c2)
                                    self.colors.append(self.c2)
                                    print("added in new colors")
                                    self.colors.shuffle()
                                    print("shuffled new colors ")
                                    self.intPicked = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
                                    print("made intPicked")
                                    collectionView.reloadData()
                                    
                                }
                                
                                
                                
                                //3 add action
                                
                                alert.addAction(okAction)
                                
                                alert.addAction(round2)
                                
                                //present alert controller
                                
                                present(alert, animated: true)
                                r=1
                            }
                            else{
                                let alert = UIAlertController(title: "CONGRATS", message: "YOU WON!!!!", preferredStyle: .alert)
                                
                                //2 create action
                                let okAction = UIAlertAction(title: "WOOHOO!!!", style: .default)
                                //3 add action
                                
                                alert.addAction(okAction)
                                
                            
                                
                                //4 present alert controller
                                
                                present(alert, animated: true)
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                       
                        for i in (0 ... colors.count-1).reversed(){
                            if(twoPicked[0] == colors[i] ){
                                print("removing color from color array ")
                                colors.remove(at: i)
                                
                            }
                            

                        }
                            
                         
                            
                            
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
                      
                      
                        
                    }
                }
            }
            
        }
        
        if(x == 3){
            x = 0
            
            print("reprinting the collection view")
            collectionView.reloadData()
         
            if let clicked = collectionView.cellForItem(at: indexPath){
          
                clicked.backgroundColor = colors[indexPath.row]
        
               
            }
           
        }
        
       
        
        
 
    }
    



}
