//
//  MainVC.swift
//  Demonstration
//
//  Created by mac  on 15/09/21.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var lblUserName: UILabel!
    var userName = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblUserName.text =  userName 
        // Do any additional setup after loading the view.
    }
}
