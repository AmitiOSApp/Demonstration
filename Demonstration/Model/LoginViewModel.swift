//
//  LoginViewModel.swift
//  Demonstration
//
//  Created by mac  on 15/09/21.
//

import RxSwift
import RxCocoa

import Foundation
class LoginViewModel {
    let userNameTextSubject = PublishSubject<String>()
    let passwordTextSubject = PublishSubject<String>()
   // let isValid: Observable<Bool>
    
    func isEnableLogin() -> Observable<Bool> {

        return Observable.combineLatest(userNameTextSubject.asObservable().startWith(""), passwordTextSubject.asObservable().startWith("")).map { userName, password in return userName.count > 5 && password.count > 5 && userName.isAlphanumeric()
        }.startWith(false)
    }
    
}
extension String {
    /// Used to validate if the given string is valid email or not
    ///
//     - Returns: Boolean indicating if the string is valid email or not
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        print("emailTest.evaluate(with: self): \(emailTest.evaluate(with: self))")
        return emailTest.evaluate(with: self)
    }
    
    func isAlphanumeric() -> Bool {
          return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
      }
    
    var alphanumeric: String {
           return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
       }

}
