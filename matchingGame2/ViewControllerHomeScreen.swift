//
//  ViewControllerHomeScreen.swift
//  matchingGame2
//
//  Created by MYKAELA WALLEN on 12/13/23.
//

import UIKit

class ViewControllerHomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toGame(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "toGame", sender: self)
        
    }
    
    
    @IBAction func toScore(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toScore", sender: self)
    }
    
    
    
  

}
