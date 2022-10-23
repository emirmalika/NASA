//
//  PopoverViewController.swift
//  NasaApp
//
//  Created by Malik Em on 05.10.2022.
//

import UIKit

class PopoverViewController: UIViewController {

    @IBOutlet weak var explanationText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        explanationText.text = "Astronomy Picture of the Day(APOD) is originated, written, coordinated and edited since 1995 by Robert Nemiroff and Jerry Bonnell. The APOD Archive contains the largest collection of annotated astronomical images of the Internet. APOD is a service of ASD at NASA /  GSFC and Michigan Technological University."
        explanationText.font = UIFont(name: "Apple SD Gothic Neo", size: 18)
    }

}
