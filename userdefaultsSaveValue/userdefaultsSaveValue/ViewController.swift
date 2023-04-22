//
//  ViewController.swift
//  userdefaultsSaveValue
//
//  Created by Rajeev on 17/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mylbl: UILabel!
    @IBOutlet var mytxt: UITextField!
    
    
    @IBOutlet var logintxt: UITextField!
    
    // var  valueName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        abc()
    }
    
    
    
    var valueName=UserDefaults.standard.string(forKey: "username")
    
    func abc()
    {
        mylbl.text = "Hello, \(valueName!)"
        
        
    }
    @IBAction func btnclick(_ sender: UIButton)
    {
        
        mylbl.text = mytxt.text
        UserDefaults.standard.set(mytxt.text!, forKey: "username")
        //
        //        let alert = UIAlertController(title: "Saving", message: "Data saved in userdefault", preferredStyle: .alert)
        //        let okbutton = UIAlertAction(title: "Ok", style: .default){(action) in
        //            print("Data has been saved")
        //
        //        }
        //        alert.addAction(okbutton)
        //        present(alert,animated: true,completion: nil)
        //        mytxt.text = ""
    }
    //    func valueSavedInAnother()
    //    {
    //        name = value
    //    }
    
    
    @IBAction func loginbtn(_ sender: Any)
    {
        if valueName == logintxt.text
        {
            
            
           // UserDefaults.standard.set(logintxt.text!,forKey: "email")
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
            navigationController?.pushViewController(vc!, animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Warning", message: "Doesn't match", preferredStyle: .alert)
            let okbutton = UIAlertAction(title: "Ok", style: .default) {(action) in
                
            }
            alert.addAction(okbutton)
            present(alert,animated: true,completion: nil)
            
            
        }
        
    }
}
