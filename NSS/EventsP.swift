//
//  EventsP.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 13/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class EventsP: UITableViewController {
    var ref: DatabaseReference!
    var refHandle = UInt()
    var refHandle2 = UInt()
    var events = [Event]()
    override func viewWillAppear(_ animated: Bool) {
        // self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        

        // Add a background view to the table view
        let backgroundImage = UIImage(named: "back.png")
        let imageView = UIImageView(image: backgroundImage)
        //self.tableView.backgroundColor = UIColor.white
        self.tableView.backgroundView = imageView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.clear;
        ref = Database.database().reference()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        events = []
        fetchEvents()
    }
    func fetchEvents(){
        print("fetchEvents called");
        refHandle = ref.child("events").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject]
            {   print(dictionary)
                print("hey")
                let event = Event()
                event.setValuesForKeys(dictionary)
                self.events.append(event)

                    print("hey2")
                    self.tableView.reloadData()
                
                
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        // Configure the cell...
        if(indexPath.row>0)
        {
            let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            let temp = events[indexPath.row-1].name ?? " "
            let temph = events[indexPath.row-1].hours ?? "1"
            cell.backgroundColor = UIColor.clear
            cell.label.text! = temp
            cell.hr.text! = temph
            return cell
        }
        else{
            let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            cell.backgroundColor = UIColor.clear
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if(indexPath.row>0)
        {
            print(events[indexPath.row-1].time!)
            event_name = events[indexPath.row-1].name!
            event_time = events[indexPath.row-1].time!
            event_desc = events[indexPath.row-1].desc!
            event_hour = events[indexPath.row-1].hours!
            event_date = events[indexPath.row-1].date!
            
            self.performSegue(withIdentifier: "EventInfoSeg", sender: nil)
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete && indexPath.row>0)
        {
           let temp = events[indexPath.row-1].name!
            var ref: DatabaseReference!
            ref = Database.database().reference()
            ref.child("events").updateChildValues([temp:NSNull()]);
            events = []
            fetchEvents()
        }
    }

    

}
