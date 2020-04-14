//
//  PastaViewController.swift
//  Cooking Time!
//
//  Created by Daniel Golęba Frygies on 14/04:105.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
//

import UIKit

class PastaViewController: UIViewController {
    
    @IBOutlet weak var pastaDescriptionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var setTimeLabel: UIButton!
    
    var timer: Timer?
    var pastaLabel: String = ""
    var cookingTime: Int = 0
    var slicerMax: Int = 0
    
    let item = Item()
    
    
    var pastaPicked: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        pastaDescriptionLabel.text = "Pick pasta type."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pastaChosen(_ sender: UIButton) {
        cookingTime = 0
        timer?.invalidate()
        progressBar.trackTintColor = .blue
        audioPlayer?.stop()
        setTimeLabel.titleLabel?.text = "Run"
        
        pastaPicked = sender.currentTitle!

        pastaDescriptionLabel.text = item.pastaButtonChosen(title: pastaPicked).2
        slicerMax = item.pastaButtonChosen(title: pastaPicked).1
        cookingTime = item.pastaButtonChosen(title: pastaPicked).1
        
    }
    
    @IBAction func setTimePressed(_ sender: UIButton) {
        audioPlayer?.stop()
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func returnCommand(_ sender: UIButton) {
        timer?.invalidate()
        dismiss(animated: true, completion: nil)
    }
}
//MARK: - Counter Mechanism
extension PastaViewController {
    
    @objc func counter () {
        cookingTime -= 1
        progressBar.progress = 1 - (Float(cookingTime) / Float(slicerMax))
        if cookingTime == 31 {
            playSound(sound: "clock_timer", type: "mp3")
        }
        
        if cookingTime <= 0 {
            audioPlayer?.stop()
            playSound(sound: "final_countdown", type: "mp3")
            timer!.invalidate()
            timer = nil
        }
        
    }
}
