//
//  EventInfo.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 13/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit

class EventInfo: UIViewController {
    @IBOutlet var eName: UILabel!
    @IBOutlet var eHr: UITextField!
    @IBOutlet var eDesc: UITextView!
    @IBOutlet var eTime: UILabel!
    @IBOutlet var eDate: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    eName.text = event_name
    eDesc.text = event_desc
    eDate.text = event_date
    eTime.text = event_time
    eHr.text = event_hour
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
