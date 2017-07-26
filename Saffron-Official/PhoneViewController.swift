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

class PhoneViewController: UIViewController {

    @IBOutlet weak var addCountryButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var getCodeButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    var finalNumber = ""
    
    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        alertView.showTitle(title, subTitle: descr, duration: 4, completeText: completeText, style: .warning, colorStyle: 0x000000, colorTextButton: 0xFFFFFF, circleIconImage: alertIcon, animationStyle: .rightToLeft)
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
            print(finalNumber)
            
            PhoneAuthProvider.provider().verifyPhoneNumber(finalNumber, completion: { (verificationID, error) in
                if let error = error {
                    print(error.localizedDescription)
                    print("Reached here")
                    self.alertPopUp(title: "Error Occurred", descr: "Please try again", completeText: "OK")
                    return
                }
                UserDefaults.standard.setValue(verificationID, forKey: "authVerificationID")
                self.view.endEditing(true)
                self.alertPopUp(title: "Entered Code", descr: "You will shortly receive a verification code via SMS", completeText: "OK")

            })
        }
    }

    @IBAction func onViewPressed(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: codeTextField.text!)
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    self.alertPopUp(title: "Error Occurred", descr: "Please try again", completeText: "OK")
                    return
                } else {
                    let userdefaults = UserDefaults.standard
                    userdefaults.set("appPage", forKey: "vc")
                    userdefaults.synchronize()
                    self.performSegue(withIdentifier: "finish", sender: nil)
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
