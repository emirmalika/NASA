//
//  Model.swift
//  NasaApp
//
//  Created by Malik Em on 05.10.2022.
//

import Foundation
import UIKit

func animateIn(popUpView: UIView, view: UIView) {
    view.addSubview(popUpView)
    popUpView.center = view.center
    popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
    popUpView.alpha = 0
    
    UIView.animate(withDuration: 0.4) {
//        visualEffectView.effect = visualEffectView.effect
        popUpView.alpha = 1
        popUpView.transform = CGAffineTransform.identity
//        popUpEplanation.text = dataResponse?.explanation
    }
}

func animateOut(popUpView: UIView) {
    UIView.animate(withDuration: 0.4, animations: {
        popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        
//        visualEffectView.effect = nil
        
    }) { (success: Bool) in
        popUpView.removeFromSuperview()
    }
}

