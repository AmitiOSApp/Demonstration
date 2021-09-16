//
//  ShowSplashScreenVC.swift
//  Demonstration
//
//  Created by mac  on 16/09/21.
//

import UIKit

class ShowSplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        perform(#selector(ShowSplashScreenVC.showmainmenu), with: nil, afterDelay: 2)
    }
    
    @objc func showmainmenu(){
        performSegue(withIdentifier: "login", sender: self)
    }

}
