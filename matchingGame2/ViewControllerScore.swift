//
//  ViewControllerScore.swift
//  matchingGame2
//
//  Created by MYKAELA WALLEN on 12/14/23.
//

import UIKit

class ViewControllerScore: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        let encoder = JSONEncoder()
        
        if let items = AppData.defaults.data(forKey: "thePpl"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Player].self, from: items){
                AppData.thePeople = decoded
            }
        }
     
        
        AppData.thePeople = AppData.thePeople.sorted(){
            $0.attempts < $1.attempts
            
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
       return AppData.thePeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        
        cell.textLabel?.text = "Name: \(AppData.thePeople[indexPath.row].name)   Attempts: \(AppData.thePeople[indexPath.row].attempts)   Score: \(AppData.thePeople[indexPath.row].score)"
        
       
        
        return cell
        
       
    }

    

    

}
