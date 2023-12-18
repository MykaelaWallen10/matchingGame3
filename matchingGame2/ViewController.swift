//
//  ViewController.swift
//  matchingGame2
//
//  Created by MYKAELA WALLEN on 12/5/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

 // Hello!
    
    
    
    @IBOutlet weak var nameOfPlayerOutlet: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var attemptsLabel: UILabel!
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    var cards = [Card]()
    var c = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    var c2 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    var c3 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    var scores = 0
    var attemps = 0
    var x = 0
    var fakeattempts = 0
    var round = 0
    var wins = 0
    var colors = [UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal, UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal    ]
    
    var twoPicked = [UIColor]()
    var intPicked = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
    var twoIntPicked = [Int]()
    
    var person = "" 
    
    override func viewDidLoad() {
 print("wtf is going on ")
        super.viewDidLoad()        // Do any additional setup after loading the view.
        
        nameOfPlayerOutlet.text = person
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        
        //colors.shuffle()
        for i in intPicked{
            cards.append(Card(matched: false, cardColor: colors[i]))
        }
       
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("printing collection view")
        return cards.count
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as UICollectionViewCell
       
        
        if( cards[indexPath.row].matched == false){
            cell.backgroundColor = UIColor.purple
            print("changing unmatched to purple ")
        }
        else{
            cell.backgroundColor = cards[indexPath.row].cardColor
            print("keeping color")
        }
     
        
        
  
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        x+=1
        if(x == 1 || x == 2){
            
            if let clicked = collectionView.cellForItem(at: indexPath){
          
                clicked.backgroundColor = colors[indexPath.row]
                
                cards[indexPath.row].cardColor = colors[indexPath.row]
        
                twoPicked.append(colors[indexPath.row])
                twoIntPicked.append(indexPath.row )
                
           
                
                if(x == 2 ){
                    print("second choice")
                
                    
                    if(twoPicked[0] == twoPicked[1]){
                        print("match")
                        cards[twoIntPicked[0]].matched = true
                        print("the first card is true")
                        cards[twoIntPicked[1]].matched = true
                        print("the second card is true")
                      
                        
                        if(fakeattempts<=11){
                            scores += 4
                        }
                            else{
                            scores += 2
                        }
                        scoreLabel.text = "Score : \(scores) "
                        print(intPicked.count)
                        
                        
                        for i in (0 ... 1).reversed(){
                            print("removing first and second")
                            intPicked.remove(at: i)

                            }
                        
                     

                        
                        //WINNING
                        
                        if(intPicked.count == 0 ){
                            for i in intPicked{
                                cards[i].matched = false
                            }
                            
                            collectionView.reloadData()
                            wins += 1
                            winLabel.text = "Wins : \(wins)"
                            if(round == 0 ){
                                print("winning!! score is \(scores) and attemps are \(attemps)")
                                //1 create Alert controller
                                let alert = UIAlertController(title: "CONGRATS", message: "YOU WON!!!!", preferredStyle: .alert)
                                
                              
                                let round2 = UIAlertAction(title: "Round 2", style: .default) { UIAlertAction in
                                    self.fakeattempts = 0
                                    for i in (0...self.colors.count-1).reversed(){
                                        self.colors.remove(at: i)
                                    }
                                    self.colors = [UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal, UIColor.black, UIColor.systemPink, UIColor.green, UIColor.blue, UIColor.gray, UIColor.magenta, UIColor.systemIndigo, UIColor.cyan, UIColor.systemTeal  ]
                                    
                                    self.colors.append(self.c)
                                    self.colors.append(self.c)
                                    self.colors.append(self.c3)
                                    self.colors.append(self.c3)
                                    self.colors.append(self.c2)
                                    self.colors.append(self.c2)
                                    print("added in new colors")
                                   // self.colors.shuffle()
                                    print("shuffled new colors ")
                                   
                                    for i in (0...self.cards.count-1).reversed(){
                                        self.cards.remove(at: i)
                                    }
                                    self.intPicked = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
                                    print("made intPicked")
                                    for i in self.intPicked{
                                        self.cards.append(Card(matched: false, cardColor: self.colors[i]))
                                    }
                                    collectionView.reloadData()
                                    
                                }
                      
                                //3 add action
                                
                          
                                
                                alert.addAction(round2)
                                
                                //present alert controller
                                
                                present(alert, animated: true)
                                round = 1
                              
                            }
                            else{
                                
                               
                                let alert = UIAlertController(title: "Hooray", message: "YOU WON!!!!", preferredStyle: .alert)
                                
                                //2 create action
                                let okAction = UIAlertAction(title: "WOOHOO!!!", style: .default){ UIAlertAction in
                                    print("the score is \(self.scores) and the attempts are \(self.attemps) ")
                                    var human = Player(name: self.person, attempts: self.attemps, score: self.scores)
                                    
                                    AppData.thePeople.append(human)
                                    
                                    let encoder = JSONEncoder()
                                    if let encoded = try? encoder.encode(AppData.thePeople){
                                        AppData.defaults.set(encoded, forKey: "thePpl")
                                    }

                                    
                                }
                                //3 add action
                                
                                alert.addAction(okAction)
              
                                //4 present alert controller
                                
                                present(alert, animated: true)
                            
                                
                               
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
            fakeattempts += 1
            attemps+=1
            attemptsLabel.text = "Attempts: \(attemps)"
            x = 0
            
            print("reprinting the collection view")
            collectionView.reloadData()
         
            if let clicked = collectionView.cellForItem(at: indexPath){
          
                clicked.backgroundColor = colors[indexPath.row]
        
               
            }
           
        }
      
       
        
 
    }
    


}
