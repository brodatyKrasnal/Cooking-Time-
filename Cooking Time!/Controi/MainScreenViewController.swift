//
//  ViewController.swift
//  Cooking Time!
//
//  Created by Daniel Golęba Frygies on 14/04:105.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToEggTimer(_ sender: UIButton) {
       performSegue(withIdentifier: "toEggTimer", sender: self)
    }
    
    @IBAction func goToPastaTimer(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPasta", sender: self)
    }
    
    
    @IBAction func goToTimer(_ sender: UIButton) {
        performSegue(withIdentifier: "goToTimer", sender: self)
    }
}

