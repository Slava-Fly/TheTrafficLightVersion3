//
//  ViewController.swift
//  TheTrafficLightVersion3
//
//  Created by User on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var labelSwitchLight: UIButton!
    
    var currentLight = CurrentLight.red
    let isOnLight: CGFloat = 1
    let isOffLight: CGFloat = 0.2
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = isOffLight
        yellowView.alpha = isOffLight
        greenView.alpha = isOffLight
   
        labelSwitchLight.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
    

    @IBAction func switchLight() {
        if labelSwitchLight.currentTitle == "START" {
            labelSwitchLight.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case.red:
            greenView.alpha = isOffLight
            redView.alpha = isOnLight
            currentLight = .yellow
        case .yellow:
            yellowView.alpha = isOnLight
            redView.alpha = isOffLight
            currentLight = .green
        case .green:
            greenView.alpha = isOnLight
            yellowView.alpha = isOffLight
            currentLight = .red
        }
    }

}


extension ViewController {
    enum CurrentLight {
        case red, yellow, green
    }
}
