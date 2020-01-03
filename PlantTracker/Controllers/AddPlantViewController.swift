//
//  AddPlantViewController.swift
//  PlantTracker
//
//  Created by Hallie Johnson on 1/2/20.
//  Copyright © 2020 Hallie Johnson. All rights reserved.
//

import UIKit
import CoreData

class AddPlantViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    // added for Type dropdown
    @IBOutlet var typeButtons: [UIButton]!
    var plantType : String! = ""
    //** end type dropdown addition
    
    // added for Light Needs dropdown
    @IBOutlet var lightButtons: [UIButton]!
    
    // ** end Light Needs dropdown
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPlantBtnPressed(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let plant = Plant(context: context)
        plant.name = textField.text!
        plant.type = plantType
        
        //Save the data to coredata
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    // Added for Type dropdown
    // Show dropdown when type is tapped
    @IBAction func handleTypeSelection(_ sender: UIButton) {
        typeButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Types: String {
        case annuals = "Annuals"
        case bulbs = "Bulbs"
        case evergreens = "Evergreens"
        case edibles = "Edibles"
        case grasses = "Grasses"
        case perennials = "Perennials"
        case shrubs = "Shrubs"
        case succulents = "Succulents"
        case trees = "Trees"
        case vines = "Vines"
    }
    
    @IBAction func typeTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let type = Types(rawValue: title) else {
            return
        }
        
        switch type {
        case .annuals:
            plantType = "Annuals"
        case .bulbs:
            plantType = "Bulbs"
        case .evergreens:
            plantType = "Evergreens"
        case .edibles:
            plantType = "Edibles"
        case .grasses:
            plantType = "Grasses"
        case .perennials:
            plantType = "Perennials"
        case .shrubs:
            plantType = "Shrubs"
        case .succulents:
            plantType = "Succulents"
        case .trees:
            plantType = "Trees"
        case .vines:
            plantType = "Vines"
        }
        
        typeButtons.forEach { (button) in
            button.isHidden = !button.isHidden
        }
    }
    
}
