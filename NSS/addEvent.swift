//
//  addEvent.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 13/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class addEvent: UIViewController,UITextFieldDelegate {
    var df = [String]()
    var dd = String()
    var tt = String()
    @IBOutlet var eName: UITextField!
    @IBOutlet var eDesc: UITextField!
    @IBOutlet var eHours: UITextField!
    @IBOutlet var eDate: UIDatePicker!
    @IBOutlet var eTime: UIDatePicker!
    @IBOutlet var scroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        eDate.setValue(UIColor.white, forKeyPath: "textColor")
        eDate.setValue(false, forKey: "highlightsToday")
        eTime.setValue(UIColor.white, forKeyPath: "textColor")
        eTime.setValue(false, forKey: "highlightsToday")
        // Do any additional setup after loading the view.
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView{
        
        print("Returning Custom label")
        var label = view as! UILabel!
        if label == nil {
            label = UILabel()
        }
        
        label?.font = UIFont(name: "Avenir-Bold", size: 22)!
        label?.textAlignment = .center
        return label!
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == eHours)
        {
            scroll.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        scroll.setContentOffset(CGPoint(x: 0, y: 0), animated:true)
        
    }
    


    @IBAction func date(_ sender: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = DateFormatter.Style.short
        
        dd = dateformatter.string(from:sender.date)
        print (dd)
    }
    
    @IBAction func dissmis(_ sender: Any) {
        self.dismiss(animated: true, completion: {})

    }
    @IBAction func time(_ sender: UIDatePicker) {
        
        let timeformatter = DateFormatter()
        
        timeformatter.timeStyle = DateFormatter.Style.short
        
        tt = timeformatter.string(from: sender.date)
        print(tt)
    }
    @IBAction func addEvent(_ sender: Any) {
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        if(eName.text != "")
        {
            ref.child("events").child(eName.text!).updateChildValues(["name":eName.text!])

        }
        if(eDesc.text != "")
        {
            ref.child("events").child(eName.text!).updateChildValues(["desc":eDesc.text!])
        }
        if(dd != "")
        {
            ref.child("events").child(eName.text!).updateChildValues(["date":dd])
        }
        if(tt != "")
        {
            ref.child("events").child(eName.text!).updateChildValues(["time":tt])
        }
        if(eHours.text != "")
        {
            ref.child("events").child(eName.text!).updateChildValues(["hours":eHours.text])
        }
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
