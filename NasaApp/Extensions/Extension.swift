//
//  Extension.swift
//  NasaApp
//
//  Created by Malik Em on 08.10.2022.
//

import Foundation
import UIKit

extension MainViewController {
    
    func shareAction() {
        let itemUrl = URL(string: dataResponse!.url)
        let itemData = try? Data(contentsOf: itemUrl!)
        let item: [Any] = [UIImage(data: itemData!) as Any]
        
        let shareController = UIActivityViewController(activityItems: item, applicationActivities: nil)
        
        present(shareController, animated: true, completion: nil)
    }
    
    func setupGestures() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        infoBtn.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func tapped() {
        
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") else { return }
        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.infoBtn
        popOverVC?.sourceRect = CGRect(x: self.infoBtn.bounds.midX, y: self.infoBtn.bounds.maxY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 260, height: 280)
        
        self.present(popVC, animated: true)
    }
}
