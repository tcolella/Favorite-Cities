//
//  DetailViewController.swift
//  Favorite Cities
//
//  Created by Tommy Colella on 1/10/20.
//  Copyright © 2020 Tommy Colella. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var detailItem: City? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    func configureView() {
        // Update the user interface for the detail item
        if let city = self.detailItem {
            if cityTextField != nil {
                cityTextField.text = city.name
                stateTextField.text = city.state
                populationTextField.text = String(city.population)
                imageView.image = UIImage(data: city.image)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        if let city = self.detailItem {
           city.name = cityTextField.text!
           city.state = stateTextField.text!
           city.population = Int(populationTextField.text!)!
        }
    }
}

