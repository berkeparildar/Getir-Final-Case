//
//  ShowAlert.swift
//  Market-App
//
//  Created by Berke Parıldar on 22.04.2024.
//

import UIKit

protocol ShowAlert {
    func showAlert(title: String, message: String)
}

extension ShowAlert where Self: UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
