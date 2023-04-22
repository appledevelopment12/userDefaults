//
//  ViewController.swift
//  userDefault
//
//  Created by Rajeev on 20/04/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var txt: UITextField!
    
    @IBOutlet var lbl: UILabel!
    
    @IBOutlet var btns: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let x = UserDefaults.standard.object(forKey: "name") as? String{
            lbl.text = x
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
//        if let x = UserDefaults.standard.object(forKey: "name") as? String{
//            lbl.text = x
//        }
    }

    @IBAction func savebtn(_ sender: Any)
    {
        
        lbl.text = txt.text
        UserDefaults.standard.set(txt.text, forKey: "name")
        txt.text = " "
    }
    
}

