//
//  DoctorListViewController.swift
//  Poiesis Group
//
//  Created by POLARIS on 11/17/17.
//  Copyright © 2017 POLARIS. All rights reserved.
//

import UIKit

class DoctorListViewController: UITableViewController {
    
    var data = DoctorData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.data.doctorDetailList.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.data.doctorDetailList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorListCell") as! DoctorListCell

        cell.doctorName?.text = row.doctorName
        cell.doctorPhoto?.image = row.doctorPhoto
        cell.doctorDetail = row.doctorInfo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.data.doctorDetailList[indexPath.row]
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DoctorDetail") as? DoctorDetialViewController else {
            return
        }
        
        vc.data = self.data
        vc.doctorIdx = indexPath.row
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
