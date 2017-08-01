//
//  WorkersViewController.swift
//  The Last Viking
//
//  Created by Christian Vila on 7/24/17.
//  Copyright © 2017 NAPPS. All rights reserved.
//


//Global Variables
var workerTextFieldGlbl:UITextField!
var workerViewGlbl:UIView!
var numOfMiners = 1000
var numOfLumberMen = 1000
var numOfBaker = 1000
var numOfStoneMen = 1000
var workersTableViewGlbl: UITableView!
var workerLabelGlbl:UILabel!

import UIKit
//arays for the tableView
var typesOfWorkers = ["Miners", "Lummber Men", "Stone Men", "Bakers"]
var arrayOfWorkers = [numOfMiners, numOfStoneMen, numOfBaker, numOfLumberMen]
var workerType: String = ""

class WorkersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
@IBOutlet var trainWorkersTextField: UITextField!
@IBOutlet var workerView: UIView!
@IBOutlet var workerTableView: UITableView!
@IBOutlet var workerLabel: UILabel!


    
    
    //prototype cell for tableView
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(typesOfWorkers.count)
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workersCell", for: indexPath) as! WorkerTableViewCell
            cell.typeOfWorker.text = typesOfWorkers[indexPath.row]
            cell.numOfWorkers.text = String(arrayOfWorkers[indexPath.row])
        return(cell)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workerTextFieldGlbl = trainWorkersTextField
        workerViewGlbl = workerView
        workersTableViewGlbl = workerTableView
        workerLabel = workerLabelGlbl

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // You're not creating troops youre simply subtracting the populatioon so the only limit you have is the pop..
    //Buttons
    @IBAction func miners(_ sender: UIButton) {
        workerLabel = workerLabelGlbl
        workerType = "miners"
        workerViewGlbl.isHidden = false
        self.checkNil()
      //  workerLabel.text = "Train Miners"
        
    }
    @IBAction func lumberMen(_ sender: UIButton) {
       
        workerType = "lumberMen"
    }
    @IBAction func stoneMen(_ sender: UIButton) {
        workerType = "stoneMen"
    }
    @IBAction func baker(_ sender: UIButton) {
        workerType = "baker"
    }
    
    @IBAction func trainWorkerButton(_ sender: UIButton) {
        workerTextFieldGlbl = trainWorkersTextField
        workerTableView = workersTableViewGlbl
        workerLabelGlbl = workerLabel
    
        if workerTextFieldGlbl.text != "" {
            self.numOfWorkers()
            print(numOfMiners)
        }
        self.view.endEditing(true)
        workerTableView.reloadData()
    }
    
    
    func numOfWorkers() {
         let workerInput = Int(trainWorkersTextField!.text!)!
            if workerType == "miners" && workerInput <= population {
                numOfMiners += workerInput
                population -= workerInput
                arrayOfWorkers[0] = numOfMiners
            }
            if workerType == "lumberMen" && workerInput <= population {
                numOfLumberMen += workerInput
                population -= workerInput
                arrayOfWorkers[1] = numOfLumberMen
            }
            if workerType == "stoneMen" && workerInput <= population {
                numOfStoneMen += workerInput
                population -= workerInput
                arrayOfWorkers[2] = numOfStoneMen
            }
        }
    //Hide Kyboard when touches outside beging 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func checkNil() {
        if workerLabelGlbl == nil {
            print("label Is Nil")
        }
    }
}



