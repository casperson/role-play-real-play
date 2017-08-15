//
//  GameplayViewController.swift
//  Real Play
//
//  Created by Braden Casperson on 7/20/17.
//  Copyright © 2017 Braden Casperson. All rights reserved.
//

import UIKit

class GameplayViewController: UIViewController {
    
    //MARK: IBOulets
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var concernLabel: UILabel!
    @IBOutlet weak var thatLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var generateScenarioButton: UIButton!
    
    //MARK: Class variables
    var scenarioPart = 1
    var scenarios: Scenarios?
    var people = [[String:Any]]()
    var places = [[String:Any]]()
    var concerns = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateScenarioButton.layer.borderColor = UIColor.white.cgColor
        generateScenarioButton.layer.cornerRadius = 4
        generateScenarioButton.layer.borderWidth = 2
        
        let scenarioDataSource = GameplayDataSource()
        scenarios = scenarioDataSource.getAvailableScenarios()
        people = (scenarios?.people)!
        places = (scenarios?.places)!
        concerns = (scenarios?.concerns)!
    }
    
    @IBAction func goBackHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func generateScenario(_ sender: Any) {
        let rando = Int(arc4random_uniform(45))
        
        if scenarioPart == 1 {
            
            hideLabels()
        }
        
        if scenarioPart == 1 {
            personLabel.text = people[rando].first?.value as? String
            aLabel.isHidden = false
            personLabel.isHidden = false
            generateScenarioButton.setTitle("Get Location", for: .normal)
        } else if scenarioPart == 2 {
            locationLabel.text = places[rando].first?.value as? String
            locationLabel.isHidden = false
            fromLabel.isHidden = false
            generateScenarioButton.setTitle("Get Concern", for: .normal)
        } else {
            concernLabel.text = concerns[rando].first?.value as? String
            thatLabel.isHidden = false
            concernLabel.isHidden = false
            generateScenarioButton.setTitle("New Scenario", for: .normal)
        }
        
        scenarioPart = scenarioPart == 3 ? 1 : scenarioPart + 1
    }
    
    func hideLabels() {
        personLabel.isHidden = true
        aLabel.isHidden = true
        locationLabel.isHidden = true
        fromLabel.isHidden = true
        thatLabel.isHidden = true
        concernLabel.isHidden = true
    }
    
}
