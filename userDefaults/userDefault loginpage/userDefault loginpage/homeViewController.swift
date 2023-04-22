//
//  homeViewController.swift
//  userDefault loginpage
//
//  Created by Rajeev on 16/04/23.
//

import UIKit

class homeViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: nil)
    }
    
    @IBAction func onClickLogout(_ sender: UIBarButtonItem)
    {
      //  var window = UIWindow?(<#UIWindow#>)

        print("user logout")
        UserDefaults.standard.removeObject(forKey: "email")
       // let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.popViewController(animated: true)
//        let navVc = UINavigationController(rootViewController: vc!)
//        let share = UIApplication.shared.delegate as? AppDelegate

    }
    
    

}
