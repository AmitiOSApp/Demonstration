//
//  LoginVC.swift
//  Demonstration
//
//  Created by mac  on 15/09/21.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVC: UIViewController {
    private let loginModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtUserName.becomeFirstResponder()
        txtUserName.rx.text.map { $0 ?? "" }.bind (to: loginModel.userNameTextSubject).disposed(by: disposeBag)
        txtUserPassword.rx.text.map { $0 ?? "" }.bind (to: loginModel.passwordTextSubject).disposed(by: disposeBag)
         
        loginModel.isEnableLogin().bind(to: btnLogin.rx.isEnabled).disposed(by: disposeBag)
        loginModel.isEnableLogin().map { $0 ? 1 : 0.1 } .bind(to: btnLogin.rx.alpha).disposed(by: disposeBag)
    
   
        txtUserName.rx.text.orEmpty.bind(to: loginModel.userNameTextSubject)
                    .disposed(by: disposeBag)
        
        txtUserPassword.rx.text.orEmpty.bind(to: loginModel.passwordTextSubject)
                    .disposed(by: disposeBag)
//        loginModel.isValid.map { $0 }
//                    .bind(to: btnLogin.rx.isEnabled)
//                    .disposed(by: disposeBag)
    
        txtUserName.addTarget(self, action: #selector(LoginVC.textFieldDidChange(_:)), for: .editingChanged)
    
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == nil{
            return
        }
        if textField.text != "" && textField.text!.isAlphanumeric() == false {
            self.txtUserName.text = textField.text!.replacingOccurrences(of: " ", with: "").alphanumeric
            let alert = UIAlertController(title: "Login", message: "Enter proper user name!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            btnLogin.isEnabled = true
            return
        }
    }
    @IBAction func actionOnLogin(_ sender: Any) {
        let vc = FMStoryboard.landing.MainVC()
        vc.userName =  "  \"Hello \(txtUserName.text ?? "")\" !" 
        self.show(vc, sender: nil)
    }
}



