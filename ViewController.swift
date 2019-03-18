//
//  ViewController.swift
//  wisielec
//
//  Created by Grzegorz Trzaska on 23.09.2016.
//  Copyright © 2016 Grzegorz Trzaska. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var bt: UIButton!
    
    
    struct MyData {
        var categ : String;
        var subcat : [String];
       
    }
    var sel = 0
    var nrkat  = String()
    let data = [
        MyData(categ: "Państwa", subcat: ["Europa","Azja","Afryka"]),
        MyData(categ: "Miasta", subcat: ["Polskie","Włoskie"]),
        MyData(categ: "Zwierzęta", subcat: ["Ssaki","Gady"]),
    ]
    
    
  
    
    
    
      var kat11 = ["polska","francja","belgia"]
    var kat12 = ["chiny","japonia","indie"]
     var kat13 = ["egipt","maroko","sudan"]
    var kat21 = ["krakow","warszawa","poznan"]
    var kat22 = ["rzym","turyn","mediolan"]
    var kat31 = ["wilk","pies","kon"]
    var kat32 = ["waz","krokodyl","zolw"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       pickerView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let urlString = "http://gtrzaska.cba.pl/index.html"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    // let currentConditions = parsedData["currently"] as! [String:Any]
                    
                    print(parsedData)
                    
                    //let currentTemperatureF = currentConditions["temperature"] as! Double
                    // print(currentTemperatureF)
                } catch let error as NSError {
                    print(error)
                }
            }
            
        }).resume()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cel = segue.destination as! ViewController3
        if(nrkat != ""){
            cel.word = nrkat}
        
    }
    
    
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 1){
            return data[sel].subcat.count
        }
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 1){
            return data[sel].subcat[row] as? String
        }
        return data[row].categ
       
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        sel = pickerView.selectedRow(inComponent: 0)
        print(pickerView.selectedRow(inComponent: 0)+1," ",pickerView.selectedRow(inComponent: 1)+1)
        
        if(pickerView.selectedRow(inComponent: 0)+1 == 1 && pickerView.selectedRow(inComponent: 1)+1 == 1){
        let diceRoll = Int(arc4random_uniform(2) + 1)
            print(diceRoll)
            nrkat = kat11[diceRoll]
        }
        if(pickerView.selectedRow(inComponent: 0)+1 == 1 && pickerView.selectedRow(inComponent: 1)+1 == 2){
            let diceRoll = Int(arc4random_uniform(2) + 1)
            nrkat = kat12[diceRoll]
        }
        if(pickerView.selectedRow(inComponent: 0)+1 == 1 && pickerView.selectedRow(inComponent: 1)+1 == 3){
            let diceRoll = Int(arc4random_uniform(2) + 1)
            nrkat = kat13[diceRoll]
        }
        if(pickerView.selectedRow(inComponent: 0)+1 == 3 && pickerView.selectedRow(inComponent: 1)+1 == 1){
            let diceRoll = Int(arc4random_uniform(2) + 1)
            nrkat = kat31[diceRoll]
        }
        if(pickerView.selectedRow(inComponent: 0)+1 == 3 && pickerView.selectedRow(inComponent: 1)+1 == 2){
            let diceRoll = Int(arc4random_uniform(2) + 1)
            nrkat = kat32[diceRoll]
        }
        if(pickerView.selectedRow(inComponent: 0)+1 == 2 && pickerView.selectedRow(inComponent: 1)+1 == 1){
            let diceRoll = Int(arc4random_uniform(2) + 1)
            nrkat = kat21[diceRoll]
        }
        if(pickerView.selectedRow(inComponent: 0)+1 == 2 && pickerView.selectedRow(inComponent: 1)+1 == 2){
            let diceRoll = Int(arc4random_uniform(2) + 1)
            nrkat = kat22[diceRoll]
        }
        pickerView.reloadAllComponents()
        if (component == 0){
            pickerView.selectRow(0, inComponent: 1, animated: true)
            
        }
    }
   
}
