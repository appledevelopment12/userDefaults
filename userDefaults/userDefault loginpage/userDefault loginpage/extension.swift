//
//  extension.swift
//  userDefault loginpage
//
//  Created by Rajeev on 16/04/23.
//

import Foundation
import UIKit
extension UIViewController
{
    
    
    public func openAlert(title: String,
message: String,
alertStyle:UIAlertController.Style,
actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
action: [((UIAlertAction) -> Void)])
    {
        let alertController =  UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index,indexTitle) in actionTitles.enumerated()
        {
            let action=UIAlertAction(title:indexTitle,style:actionStyles[index],handler: action[index])
            alertController.addAction(action)
            
            
        }
       // self.present(alertController,animated: true)
        self.present(alertController,animated: true)
    }
}
