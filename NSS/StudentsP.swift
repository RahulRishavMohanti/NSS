//
//  StudentsP.swift
//  NSS
//
//  Created by Rahul Rishav Mohanti on 13/02/18.
//  Copyright © 2018 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
class student: NSObject {
    
    var name: String?
    var roll: String?
    var gender: String?
    var contact: String?
}
class StudentsP: UITableViewController {
    var ref: DatabaseReference!
    var refHandle = UInt()
    var refHandle2 = UInt()
    var students = [student]()
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
       ref = Database.database().reference() 
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.clear;
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        students = []
        fetchStudents()
    }
    func fetchStudents(){
        print("fetchFinance called");
        refHandle = ref.child("student").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject]
            {   print(dictionary)
                print("hey")
                let stude = student()
                stude.setValuesForKeys(dictionary)
                self.students.append(stude)
                print(self.students[0].name ?? "x")
                DispatchQueue.main.async() {
                    print("hey2")
                    self.tableView.reloadData()
                }
                
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
        return students.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row>0)
        {
            let cell = Bundle.main.loadNibNamed("TableViewStudentCell", owner: self, options: nil)?.first as! TableViewStudentCell
            let temp = students[indexPath.row-1].name ?? " "
            let temph = students[indexPath.row-1].roll ?? " "
            cell.label.text! = temp
            cell.roll.text! = temph
            cell.backgroundColor = UIColor.clear
            return cell
        }
        else{
            let cell = Bundle.main.loadNibNamed("TableViewStudentCell", owner: self, options: nil)?.first as! TableViewStudentCell
            cell.backgroundColor = UIColor.clear
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if(indexPath.row>0)
        {
            stud_name = students[indexPath.row-1].name!
            stud_roll = students[indexPath.row-1].roll!
            stud_gender = students[indexPath.row-1].gender!
            stud_contact = students[indexPath.row-1].contact!
            self.performSegue(withIdentifier: "StudentInfoSeg", sender: nil)
        }
    }




    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
