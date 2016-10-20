//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var fruitPicker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitPicker.dataSource = self
        fruitPicker.delegate = self
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        let randomFruit1 = Int(arc4random_uniform(UInt32(fruitsArray.count) - 1))
        let randomFruit2 = Int(arc4random_uniform(UInt32(fruitsArray.count) - 1))
        let randomFruit3 = Int(arc4random_uniform(UInt32(fruitsArray.count) - 1))
        fruitPicker.selectRow(randomFruit1, inComponent: 0, animated: true)
        fruitPicker.selectRow(randomFruit2, inComponent: 1, animated: true)
        fruitPicker.selectRow(randomFruit3, inComponent: 2, animated: true)
        
        spinOutcome()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    func spinOutcome() {
        var fruit1 = fruitPicker.selectedRow(inComponent: 0)
        var fruit2 = fruitPicker.selectedRow(inComponent: 1)
        var fruit3 = fruitPicker.selectedRow(inComponent: 2)
        
        if fruit1 == fruit2 && fruit2 == fruit3 {
            resultLabel.text = "WINNER!"
        } else {
            resultLabel.text = "TRY AGAIN"
        }
        
    }
    
    
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



