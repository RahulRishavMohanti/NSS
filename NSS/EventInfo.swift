//
//  EventInfo.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 13/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EventInfo: UIViewController {
    var studcoords = [studcoord]()
    @IBOutlet var eName: UILabel!
    @IBOutlet var eHr: UITextField!
    @IBOutlet var eDesc: UITextView!
    @IBOutlet var eTime: UILabel!
    @IBOutlet var eDate: UILabel!
    @IBOutlet var go: UIButton!
    var flag = 0
    @IBOutlet var eReg: UILabel!
    
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
    ref = Database.database().reference()
    eName.text = event_name
    eDesc.text = event_desc
    eDate.text = event_date
    eTime.text = event_time
    eHr.text = event_hour
    eReg.text = event_reg + " going!"
    var studCoordinators = event_studcoord.characters.split{$0 == ","}.map(String.init)
    let studsRegistered = event_stud.characters.split{$0 == ","}.map(String.init)
    
        if(studsRegistered.contains(curr_user))
    {
        go.isEnabled = false
        if(self.studcoords.count>1)
        {
            if(Int(event_reg)! > 2)
        {
            print("this ran!")
            self.eReg.text = self.studcoords[1].Name! + " " + self.studcoords[1].Contact!
            self.go.isHidden = true

            }
        else
        {
            self.eReg.text = self.studcoords[0].Name! + " " + self.studcoords[0].Contact!
            self.go.isHidden = true
            
        }
        }
        
        
    }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        studcoords=[]
        fetchStudcoord()
    }
    @IBAction func goLike(_ sender: Any) {
        let tt = Int(event_reg)! + 1
        let x = String(tt)
        event_stud = event_stud + "," + curr_user
        ref.child("events").child(event_name).updateChildValues(["reg":x])
        ref.child("events").child(event_name).updateChildValues(["studs":event_stud])
        flag = 1
        
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchStudcoord(){
        var refHandle = UInt()
        var refHandle2 = UInt()
        refHandle = ref.child("studcoord").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject]
            {   print(dictionary)
                print("hey")
                let event = studcoord()
                event.setValuesForKeys(dictionary)
                self.studcoords.append(event)
                print(self.studcoords.count)
              /*  if(self.studcoords.count>1)
                {
                    if(Int(event_reg)! > 2)
                    {
                        print("this ran!")
                        self.eReg.text = self.studcoords[1].Name! + " " + self.studcoords[1].Contact!
                        self.go.isHidden = true
                        
                    }
                    else
                    {
                        self.eReg.text = self.studcoords[0].Name! + " " + self.studcoords[0].Contact!
                        self.go.isHidden = true
                        
                    }
                }*/
            }
        })
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
