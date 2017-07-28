//
//  PhoneViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 22/07/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import Planet
import SCLAlertView
import FirebaseAuth
import FirebaseDatabase
import MBProgressHUD

class PhoneViewController: UIViewController {

    @IBOutlet weak var addCountryButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var getCodeButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    var finalNumber = ""
    var userName = ""
    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isUserInteractionEnabled = false
        getCodeButton.layer.cornerRadius = 8
        doneButton.layer.cornerRadius = 8
        addCountryButton.layer.cornerRadius = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertPopUp(title: String, descr: String, completeText: String) {
        let appearance = SCLAlertView.SCLAppearance(kCircleHeight: 50, kCircleIconHeight: 50, showCircularIcon: true)
        let alertView = SCLAlertView(appearance: appearance)
        let alertIcon = UIImage(named: "logoWithoutBG")
        alertView.showTitle(title, subTitle: descr, duration: 6, completeText: completeText, style: .warning, colorStyle: 0x000000, colorTextButton: 0xFFFFFF, circleIconImage: alertIcon, animationStyle: .rightToLeft)
    }
    
    func alertPopUpWithTextField(userUID: String, userPhone:String, title: String, descr: String, completeText: String) {
        let appearance = SCLAlertView.SCLAppearance(kCircleHeight: 50, kCircleIconHeight: 50, showCircularIcon: true)
        let alertView = SCLAlertView(appearance: appearance)
        let alertIcon = UIImage(named: "logoWithoutBG")
        let text = alertView.addTextField("name")
        alertView.showTitle(title, subTitle: descr, duration: nil, completeText: nil, style: .warning, colorStyle: 0x000000, colorTextButton: 0xFFFFFF, circleIconImage: alertIcon, animationStyle: .rightToLeft).setDismissBlock {
            if text.text == "" {
                self.alertPopUpWithTextField(userUID: userUID, userPhone: userPhone, title: title, descr: descr, completeText: completeText)
            } else {
                self.userName = text.text!
                print(self.userName)
                let newUser = User.init(uid: userUID, orders: 0, ordersValue: 0.0, mobileNumber: userPhone, username: self.userName)
                let databaseRef = Database.database().reference().child("users").child(newUser.uid)
                databaseRef.updateChildValues(newUser.dictValue, withCompletionBlock: { (error, reference) in
                    if error != nil {
                        self.alertPopUp(title: "Error Occurred", descr: "Please close the app and try again", completeText: "OK")
                        return
                    }
                })
                let userdefaults = UserDefaults.standard
                userdefaults.set("appPage", forKey: "vc")
                userdefaults.synchronize()
                self.performSegue(withIdentifier: "finish", sender: nil)
            }
        }
    }


    
    @IBAction func onPressed(_ sender: Any) {
        
        let countryPickerController = CountryPickerViewController()
        countryPickerController.delegate = self
        countryPickerController.showsCallingCodes = true
        let navController = UINavigationController(rootViewController: countryPickerController)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onGetCodePressed(_ sender: Any) {
        if addCountryButton.titleLabel?.text == "+" {
            alertPopUp(title: "Did not select country", descr: "Please press the add button to select a country", completeText: "OK")
        } else if self.phoneNumberTextField.text == "Enter Phone Number Here" {
            alertPopUp(title: "Enter Phone Number", descr: "Please type in your phone number", completeText: "OK")
        } else if addCountryButton.titleLabel?.text == "+267" && phoneNumberTextField.text?.characters.count != 8 {
            alertPopUp(title: "Enter Valid Number", descr: "Please enter a valid phone number", completeText: "OK")
        } else {
            finalNumber = finalNumber + phoneNumberTextField.text!
            MBProgressHUD.showAdded(to: self.view, animated: true)
            PhoneAuthProvider.provider().verifyPhoneNumber(finalNumber, completion: { (verificationID, error) in
                if let error = error {
                    print(error.localizedDescription)
                    print("Reached here")
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.alertPopUp(title: "Error Occurred", descr: "Please try again", completeText: "OK")
                    return
                }
                MBProgressHUD.hide(for: self.view, animated: true)
                UserDefaults.standard.setValue(verificationID, forKey: "authVerificationID")
                self.view.endEditing(true)
                self.alertPopUp(title: "Entered Code", descr: "You will shortly receive a verification code via SMS", completeText: "OK")
                self.doneButton.isUserInteractionEnabled = true

            })
        }
    }

    @IBAction func onViewPressed(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        if let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: codeTextField.text!)
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    print("HERE NOW")
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.alertPopUp(title: "Error Occurred", descr: "Please close the app and try again", completeText: "OK")
                    return
                } else {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    if let user = user {
                        self.alertPopUpWithTextField(userUID: user.uid, userPhone: user.phoneNumber!, title: "Enter Name", descr: "Please enter your name in the text field", completeText: "Done")
                    }
                }
            })
        }
    }

}

extension PhoneViewController: CountryPickerViewControllerDelegate {
    
    
    func countryPickerViewControllerDidCancel(_ countryPickerViewController: CountryPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func countryPickerViewController(_ countryPickerViewController: CountryPickerViewController, didSelectCountry country: Country) {
        addCountryButton.setTitle(country.callingCode, for: .normal)
        finalNumber = "\(country.callingCode)"
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
