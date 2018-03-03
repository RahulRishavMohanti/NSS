//
//  updateStudentDetails.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 15/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
class updateStudentDetails: UIViewController,UITextFieldDelegate {

    @IBOutlet var name: UITextField!

    @IBOutlet var update: UIButton!
    @IBOutlet var contact: UITextField!
    @IBOutlet var gender: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }


    @IBOutlet var updateDetails: UIButton!
    @IBAction func updateDetails(_ sender: Any) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("student").child((curr_user)).updateChildValues(["Roll":name.text ?? "N/a"])
        ref.child("student").child((curr_user)).updateChildValues(["Gender":gender.text ?? "N/a"])
        ref.child("student").child((curr_user)).updateChildValues(["Contact":contact.text ?? "N/a"])
        print("done")

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
