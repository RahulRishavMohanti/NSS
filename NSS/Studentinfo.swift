//
//  Studentinfo.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 13/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit

class Studentinfo: UIViewController {

    @IBOutlet var sName: UILabel!
    @IBOutlet var sRoll: UILabel!
    @IBOutlet var sGender: UILabel!
    @IBOutlet var sContact: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        sName.text = stud_name
        sRoll.text = stud_roll
        sGender.text = stud_gender
        sContact.text = stud_contact
        // Do any additional setup after loading the view.
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
