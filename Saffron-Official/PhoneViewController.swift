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


    
    @IBAction func onPressed(_ sender: Any) {
        
        let countryPickerController = CountryPickerViewController()
        countryPickerController.delegate = self
        countryPickerController.showsCallingCodes = true
        let navController = UINavigationController(rootViewController: countryPickerController)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onGetCodePressed(_ sender: Any) {
        let alert = SCLAlertView()
        if addCountryButton.titleLabel?.text == "+" {
            alert.showError("Did not select country", subTitle: "Please press the add button to select a country")
        } else if self.phoneNumberTextField.text == "Enter Phone Number Here" {
            alert.showError("Enter Phone Number", subTitle: "Please type in your phone number")
        } else if addCountryButton.titleLabel?.text == "+267" && phoneNumberTextField.text?.characters.count != 8 {
            alert.showError("Enter Valid Number", subTitle: "Please enter a valid phone number")
        } else {
            finalNumber = finalNumber + phoneNumberTextField.text!
            print(finalNumber)
            
            PhoneAuthProvider.provider().verifyPhoneNumber(finalNumber, completion: { (verificationID, error) in
                if let error = error {
                    print(error.localizedDescription)
                    print("Reached here")
                    alert.showError("Error", subTitle: "An error occurred, please try again")
                    return
                }
                UserDefaults.standard.setValue(verificationID, forKey: "authVerificationID")
                self.view.endEditing(true)
                let appearance = SCLAlertView.SCLAppearance(kCircleHeight: 50, kCircleIconHeight: 50, showCircularIcon: true)
                let alertView = SCLAlertView(appearance: appearance)
                let alertViewIcon = UIImage(named: "logoWithoutBG")
                alertView.showTitle("Enter Code", subTitle: "You will shortly receive a verification code via SMS", duration: nil, completeText: "No", style: .warning, colorStyle: 0x000000, colorTextButton: 0xFFFFFF, circleIconImage: alertViewIcon, animationStyle: .rightToLeft)
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
