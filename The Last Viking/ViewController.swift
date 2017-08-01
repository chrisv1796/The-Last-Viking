//
//  ViewController.swift
//  The Last Viking
//
//  Created by Christian Vila on 6/20/17.
//  Copyright © 2017 NAPPS. All rights reserved.
//

import UIKit

//global location variable 

var gold = 1000
var food = 10000
var typeOfSoldier: Int = 0
var archers = 50
var soldiers = 1
var giants = 50
var longArchers = 50
var spies = 50
var elephants = 50
var result = 0
var miners = 5
var stoneMen = 5
var lumberMen = 5
var baker = 5
var population = 5000






class ViewController: UIViewController {
    @IBOutlet weak var location: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let locationName = "Village"
        location.text = locationName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func troopsView(_ sender: Any) {
        location.text = "Troops"
        
        performSegue(withIdentifier: "troops", sender: self)
    }
    @IBAction func workersButton(_ sender: UIButton) {
        location.text = "Workers"
        performSegue(withIdentifier: "workersPage", sender: self)
    }

}

