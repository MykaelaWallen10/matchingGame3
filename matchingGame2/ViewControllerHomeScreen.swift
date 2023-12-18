//
//  ViewControllerHomeScreen.swift
//  matchingGame2
//
//  Created by MYKAELA WALLEN on 12/13/23.
//

import UIKit

var realName = ""


    
class ViewControllerHomeScreen: UIViewController {
    
    @IBOutlet weak var nameOutlet: UITextField!


    @IBOutlet weak var imageView: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let encoder = JSONEncoder()
        
        if let items = AppData.defaults.data(forKey: "thePpl"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Player].self, from: items){
                AppData.thePeople = decoded
            }
        }
//        
//        

        
        
     
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toGame(_ sender: UIButton) {
        
        if let r = nameOutlet.text {
            realName = r
        }
        nameOutlet.text = ""
        performSegue(withIdentifier: "toGame", sender: self)
        
    }
    
    
    @IBAction func toScore(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toScore", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nvc = segue.destination as? ViewController{
            
            nvc.person = realName
        }
        
    }
    
  

}
