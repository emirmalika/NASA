//
//  ViewController.swift
//  NasaApp
//
//  Created by Malik Em on 25.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpEplanation: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        
        shareAction()
    }
    
    @IBAction func showDetailsBtn(_ sender: UIButton) {
        animateIn(popUpView: popUpView, view: view)
        popUpEplanation.text = dataResponse?.explanation
    }
    
    @IBAction func dissmissBtn(_ sender: UIButton) {
        animateOut(popUpView: popUpView)
    }
    
    @IBAction func showInfoBtn(_ sender: UIButton) {
        setupGestures()
    }
    
    let networkService = NetworkService()
    var dataResponse: DataResponse? = nil
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.black
        
        imageView.isHidden = true
        imageView.alpha = 0
        
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=tr8lndmovLd6kosL7d6xkmdWZfqfHYx4Hp58vNAo"
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let dataResponse):
                self.dataResponse = dataResponse
                self.dateLabel.text = dataResponse.date
                self.titleBtn.setTitle("\(dataResponse.title)     ^", for: .normal) 
                let imageUrl = URL(string: dataResponse.url)
                let imageData = try? Data(contentsOf: imageUrl!)
                self.imageView.image = UIImage(data: imageData!)
            case .failure(let error):
                print("error:", error)
            }
        }
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        
        UIView.animate(withDuration: 0, delay: 3, options: .curveEaseInOut) {
            self.imageView.alpha = 1
        } completion: { (finished) in
            self.activityIndicator.stopAnimating()
            self.imageView.isHidden = false
        }

    }
    
    
}

extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}


