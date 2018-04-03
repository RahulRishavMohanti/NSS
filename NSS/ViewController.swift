//
//  ViewController.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 12/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
var curr_user = String()
var segflag = 0
var event_name = String()
var event_desc = String()
var event_time = String()
var event_date = String()
var event_reg = String()
var event_hour = String()
var stud_name = String()
var stud_roll = String()
var stud_gender = String()
var stud_contact = String()
var event_stud = String()
var event_studcoord = String()


class ViewController: UIViewController, UITextFieldDelegate {
        var name = [String]()
    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var UserName: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var butt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
            scroll.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        scroll.setContentOffset(CGPoint(x: 0, y: 0), animated:true)
        
    }

    @IBAction func checkIn(_ sender: Any) {
        print("clicked")
        
        Password.resignFirstResponder()
        Auth.auth().createUser(withEmail: UserName.text!, password: Password.text!)
        { (user, error) in
            if error != nil
            {   self.name = self.UserName.text!.characters.split{$0 == "@"}.map(String.init)
                self.login()
            }
            else
            {
                print("User Created")
                self.name = self.UserName.text!.characters.split{$0 == "@"}.map(String.init)
                if(self.name[0] != "s.balaji")
                {
                var ref: DatabaseReference!
                ref = Database.database().reference()
            ref.child("student").child((user?.uid)!).updateChildValues(["Name":self.name[0]])
                    ref.child("student").child((user?.uid)!).updateChildValues(["Roll":"N/A"])
                    ref.child("student").child((user?.uid)!).updateChildValues(["Gender":"N/A"])
                    ref.child("student").child((user?.uid)!).updateChildValues(["Contact":"N/A"])
                }
                self.login()
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: UserName.text!, password: Password.text!) { (user, error) in
            if error != nil
            {
                print("Incorrect Pass")
            }
            else
            {   curr_user = (user?.uid)!
                if(self.name[0]=="s.balaji")
                {self.performSegue(withIdentifier: "segue1", sender: nil)}
                else
                {
                    self.performSegue(withIdentifier: "segue2", sender: nil)
                }
            }
        }



}
}
