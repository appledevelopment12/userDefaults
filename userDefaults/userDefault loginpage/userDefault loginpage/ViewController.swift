//
//  ViewController.swift
//  userDefault loginpage
//
//  Created by Rajeev on 16/04/23.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var myProfileImage: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var MyTable: UITableView!
    @IBOutlet var editbtn: UIButton!
    @IBOutlet var camerabtn: UIButton!
    @IBOutlet var lblName: UILabel!
     var editTextField: UITextField!
    
    
    
    
    var viewOpen:Bool = true
    var titleNames = ["ProfileEdit","Profile","Support","Setting"]
    var images = ["editProfile1","profile1","support1","setting1"]
    
    
    let email = "kumar.rohit512000@gmail.com"
    let password = "Rohit@123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.containerView.isHidden = true
        viewOpen = false
       MyTable.backgroundColor = .black
        myProfileImage.layer.cornerRadius = 61
        editbtn.layer.cornerRadius = 10
        editbtn.backgroundColor = UIColor.white
        containerView.backgroundColor = UIColor.black
        camerabtn.layer.cornerRadius = 25
        
       
        let value=UserDefaults.standard.string(forKey: "username")
        if value != nil
        {
            lblName.text = "Rohit, \(value!)"
        }

        
    }
    
    @IBAction func editBtnAction(_ sender: UIButton)
    {
//
               UserDefaults.standard.set(lblName.text!, forKey: "username")
        
                let alert = UIAlertController(title: "Saving", message: "Data saved in userdefault", preferredStyle: .alert)
                let okbutton = UIAlertAction(title: "Save", style: .default){(action) in
                    print("Data has been saved")
        
                }
        alert.addTextField()
        {
            (UITextField) in self .editTextField = UITextField
        }
                alert.addAction(okbutton)
                present(alert,animated: true,completion: nil)
                lblName.text = ""
        
////
////        let dialogMessage=UIAlertController(title: "Add data", message: "Enter Student details", preferredStyle: .alert)
////        let okAction=UIAlertAction(title: "OK", style: .default) { [self] (action) in
////
////            let newName = self.editTextField.text!
//
//        }
//   //     let cancelAction=UIAlertAction(title: "cancel", style: .cancel){(action) in print("Cancel the Operation")
//    //    }
//            dialogMessage.addAction(okAction)
//          //  dialogMessage.addAction(cancelAction)
//            dialogMessage.addTextField()
//            {
//                (UITextField) in self.editTextField=UITextField
//                //self.studentN.placeholder="Name of student"
//            }
//        dialogMessage.addAction(okAction)
//        //        present(alert,animated: true,completion: nil)
//                lblName.text = ""
//            self.present(dialogMessage,animated: true,completion: nil)
//        }
//
        self.present(alert,animated: true,completion: nil)
}
    
    
    
    @IBAction func cameraBtn(_ sender: UIButton)
    {
    
        
        let ac = UIAlertController(title: "Select Image", message: "Select image from?", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default){[weak self] (_) in
            self?.showImagePicker(Selectedsource: .camera)
        }
        let libraryBtn = UIAlertAction(title: "Library", style: .default){[weak self] (_) in
            self?.showImagePicker(Selectedsource: .photoLibrary)
            
        }
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
        ac.addAction(cameraBtn)
        ac.addAction(libraryBtn)
        ac.addAction(cancelBtn)
        self.present(ac,animated: true,completion: nil)
        
    }
        
        
      //  UserDefaults.standard.set(myProfileImage.image, forKey: "username")
        
//        let alert = UIAlertController(title: "Saving", message: "Data saved in userdefault", preferredStyle: .alert)
//        let okbutton = UIAlertAction(title: "Ok", style: .default){(action) in
//            print("Data has been saved")
//
//        }
//        alert.addAction(okbutton)
//        present(alert,animated: true,completion: nil)
//        myProfileImage.image = UIImage()
//
        
    
    func showImagePicker(Selectedsource:UIImagePickerController.SourceType)
    {
        guard UIImagePickerController.isSourceTypeAvailable(Selectedsource)
                else
        {
            print("Selected souce not available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = Selectedsource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage
        {
            myProfileImage.image = selectedImage
        }
        else
        {
            print("Image not found")
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
    
    
    
    
    @IBAction func onClickLogin(_ sender: UIButton)
    {
        
        if email == txtEmail.text!, password  == txtPassword.text!
        {
            
            UserDefaults.standard.set(txtEmail.text!,forKey: "email")
            let vc = storyboard?.instantiateViewController(withIdentifier: "homeViewController")
            navigationController?.pushViewController(vc!, animated: true)
        }
        else
        {
            
                openAlert(title:"Alert",message:"email and password is doesn't match.",alertStyle: .alert,actionTitles: ["Okay"],actionStyles:[.default],action: [{ _ in
                print("okay clicked!")
                
                
            }])
        }
    }
    
    @IBAction func btnClick(_ sender: UIBarButtonItem)
    {
        
        
        containerView.isHidden = false
        MyTable.isHidden = false
        if !viewOpen
        {
         viewOpen = true
            containerView.frame = CGRect(x: 0, y: 103, width: 0, height: 749)
            MyTable.frame = CGRect(x: 0, y: 0, width: 0, height: 749)
            UIView.animate(withDuration: 0.5)
            {
                self.containerView.frame = CGRect(x: 0, y: 103, width: 240, height: 749)
                self.MyTable.frame = CGRect(x: 0, y: 0, width: 240, height: 749)
            }
            
        }
        else
        {
            containerView.isHidden = true
            MyTable.isHidden = true
            viewOpen = true
            containerView.frame = CGRect(x: 0, y: 103, width: 0, height: 749)
            MyTable.frame = CGRect(x: 0, y: 0, width: 0, height: 749)
            UIView.animate(withDuration: 0.5)
            {
                self.containerView.frame = CGRect(x: 0, y: 103, width: 240, height: 749)
                self.MyTable.frame = CGRect(x: 0, y: 0, width: 240, height: 749)
            }
            
        }
        
        
    }
    
    
    

}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //   let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! //TitileTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        TitleTableViewCell
        cell.lbll.text = titleNames[indexPath.row]
        cell.img.image = UIImage(named: images[indexPath.row])
        cell.lbll.tintColor = .white
        cell.backgroundColor = .black
        cell.img.tintColor = .white
        return cell
    }
    
    
}
