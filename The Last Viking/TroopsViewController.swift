//
//  VillageViewController.swift
//  The Last Viking
//
//  Created by Christian Vila on 6/21/17.
//  Copyright © 2017 NAPPS. All rights reserved.
//

import UIKit

var soldierCountGlbl:UILabel!
var archerCountGlbl:UILabel!
var giantCountGlbl:UILabel!
var longArcherCountGlbl:UILabel!
var trainTroopslabelGlbl:UILabel!
var textFieldGlbl:UITextField!
var trainTroopsGlbl:UIButton!
var troopsViewGlbl:UIView!
var doneButtonGlbl:UIButton!
var troopsPageViewGlbl:UIView!
var mainMenuGlbl:UIButton!
var troopType: Int = 0
var troopTableViewGlbl: UITableView!


var arrayOfTroops = [soldiers, archers, giants, longArchers, spies, elephants]
let arrayOfTroopTypes = ["Soldiers", "Archers", "Giants", "Long Archers", "Spies", "Elephants"]


class TroopsViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var troopsTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(arrayOfTroops.count)
        
    }
    
 
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "troopCell", for: indexPath) as! TroopsTableViewCell
        
        cell.troopTypeLabel.text = arrayOfTroopTypes[indexPath.row]
        cell.troopCountLabel.text = String(arrayOfTroops[indexPath.row])
        
        return(cell)
    }
    
    @IBOutlet weak var troopsLocation: UILabel!
    
    //All the Troops Count Labels.
    
    @IBOutlet weak var mainMenu: UIButton!
    @IBOutlet var troopsPageView: UIView!
    @IBOutlet weak var trainTroopsLabel: UILabel?
    @IBOutlet var troopTextField: UITextField?
    @IBOutlet var trainTroopsView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    var foodPerTroop = 0
    var goldPerTroop = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.troopTextField?.delegate = self
        //soldierCountGlbl = soldiersCount
        doneButtonGlbl = doneButton
        troopsViewGlbl = trainTroopsView
        troopsPageViewGlbl = troopsPageView
        mainMenuGlbl = mainMenu
        troopTableViewGlbl = troopsTableView
        
    

        
       /* if textFieldDidBeginEditing(archersInput!) == false {
            trainButton?.isHidden = false
        }else {
            
        }
    */
    }
    
    //Button To Train Troops
    @IBAction func trainTroops(_ sender: Any) {
        troopsTableView = troopTableViewGlbl
        
        textFieldGlbl = troopTextField
        print("troopType, \(troopType)")
        if troopType == soldiers {
            self.armyCost(foodPerTroop: 1, goldPerTroop: 1)
            arrayOfTroops[0] = soldiers
        }
        if troopType == archers {
            self.armyCost(foodPerTroop: 1, goldPerTroop: 5)
            arrayOfTroops[1] = archers
        }
        if troopType == giants {
            self.armyCost(foodPerTroop: 10, goldPerTroop: 4)
           arrayOfTroops[2] = giants
        }
        if troopType == longArchers {
            self.armyCost(foodPerTroop: 2, goldPerTroop: 15)
          arrayOfTroops[3] = longArchers
        }
        if troopType == spies {
            self.armyCost(foodPerTroop: 3, goldPerTroop: 25)
            arrayOfTroops[4] = spies
            
        }
        if troopType == elephants {
            self.armyCost(foodPerTroop: 25, goldPerTroop: 3)
            arrayOfTroops[5] = elephants
        }
        self.view.endEditing(true)
        
        self.checkifNil()
        
        troopTableViewGlbl.reloadData()
    }
    @IBAction func trainArchers(_ sender: UIButton) {
        trainTroopsView.isHidden = false
        troopType = archers
        print("food, \(food)")
        print("gold, \(gold)")
    }
    @IBAction func trainSoldiers(_ sender: UIButton) {
        troopType = soldiers
        trainTroopsView.isHidden = false
        troopTableViewGlbl.endUpdates()
    }
    @IBAction func trainGiants(_ sender: UIButton) {
        troopType = giants
        trainTroopsView.isHidden = false
    }
    @IBAction func trainLongArchers(_ sender: UIButton) {
        troopType = longArchers
        trainTroopsView.isHidden = false
    }
    
    @IBAction func trainSpies(_ sender: UIButton) {
        troopType = spies
        trainTroopsView.isHidden = false
    }
    @IBAction func trainElephans(_ sender: UIButton) {
        troopType = elephants
        trainTroopsView.isHidden = false
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        troopsViewGlbl.isHidden = true
    }
    @IBAction func mainMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "goBackToVillage", sender: self)
        self.view.endEditing(true)
    }
    
    
    
    
    // Functions
    func updateText() {
        soldierCountGlbl.text = String(soldiers)
        archerCountGlbl.text = String(archers)
        if soldierCountGlbl == nil {
            print("No can do")
        }
    }
    
    // function for the subtracting the food and the gold per troop & for the troop tyoe
    func armyCost(foodPerTroop: Int, goldPerTroop: Int) {
        if textFieldGlbl!.text != "" {
            let input = Int(troopTextField!.text!)!
            
            if troopType == soldiers && food >= input * foodPerTroop && (gold >= input * goldPerTroop) {
                soldiers += input
                self.subtractFoodPerTroop(foodPerTroop: foodPerTroop, goldPerTroop: goldPerTroop)
                troopType = soldiers
                
            }
            if troopType == archers && food >= input * foodPerTroop && (gold >= input * goldPerTroop) {
                archers += input
                self.subtractFoodPerTroop(foodPerTroop: foodPerTroop, goldPerTroop: goldPerTroop)
                troopType = archers
            }
            if troopType == giants {
                if food >= input * foodPerTroop && gold >= input * goldPerTroop {
                    giants += input
                    self.subtractFoodPerTroop(foodPerTroop: foodPerTroop, goldPerTroop: goldPerTroop)
            }
                troopType = giants
        }
            if troopType == longArchers {
                if food >= input * foodPerTroop && gold >= input * goldPerTroop {
                    longArchers += input
                    self.subtractFoodPerTroop(foodPerTroop: foodPerTroop, goldPerTroop: goldPerTroop)
                }
                troopType = longArchers
            }
            if troopType == spies {
                if food >= input * foodPerTroop && gold >= input * goldPerTroop {
                    spies += input
                    self.subtractFoodPerTroop(foodPerTroop: foodPerTroop, goldPerTroop: goldPerTroop)
                }
            }
            if troopType == elephants {
                if food  >= input * foodPerTroop && gold >= input * goldPerTroop {
                    elephants += input
                    self.subtractFoodPerTroop(foodPerTroop: foodPerTroop, goldPerTroop: goldPerTroop)
                }
                troopType = elephants
            }
            
            
            if food <= input * foodPerTroop {
                print("you need more food")
            }
            if gold <= input * goldPerTroop {
                print("you need more gold")
            }
        }
    }
    func subtractFoodPerTroop(foodPerTroop: Int, goldPerTroop: Int) {
       let input = Int(troopTextField!.text!)!
            food -= input * foodPerTroop
            gold -= input * goldPerTroop
    }
    
    func checkNil() {
        if trainTroopsGlbl == nil {
            print("Train BUtton = nil")
        }
        if textFieldGlbl == nil {
            print("TextField = nil")
        }
    }
    
    //Hide Keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func checkifNil() {
    if troopsTableView == nil {
    print("troops table view is nil")
    }
    }
    

}
