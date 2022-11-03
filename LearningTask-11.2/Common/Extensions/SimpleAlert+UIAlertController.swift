//
//  SimpleAlert+UIAlertController.swift
//  LearningTask-11.2
//
//  Created by rafael.rollo on 03/11/2022.
//

import UIKit

extension UIAlertController {
    
    static func showError(_ message: String,
                          in viewControllerOnTheTop: UIViewController) {
        let title = "Erro"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(action)
        
        viewControllerOnTheTop.present(alert, animated: true)
    }
    
}
