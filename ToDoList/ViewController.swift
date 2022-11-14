//
//  ViewController.swift
//  ToDoList
//
//  Created by Sarthak Vashistha on 2022-11-12.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var task: [String] = ["Task#1", "Task#2", "Task#3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo App"
        // Do any additional setup after loading the view.
    }

   
    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                
                cell.textLabel?.text = task[indexPath.row]
                
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
       
                switchView.tag = indexPath.row
                switchView.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
                cell.accessoryView = switchView
                
                
                
                return cell
    }
    @objc func switchDidChange(_ sender: UISwitch){
        print("sender is \(sender.tag)")
    }
}

