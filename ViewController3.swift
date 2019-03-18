//
//  ViewController3.swift
//  wisielec
//
//  Created by Grzegorz Trzaska on 23.09.2016.
//  Copyright © 2016 Grzegorz Trzaska. All rights reserved.
//

import UIKit

class ViewController3: UIViewController,UITextFieldDelegate {
    var word:String!
   var slowo = String()
  // var czybylo = String()
   var czybylo = ""
    @IBOutlet weak var kay: UITextField!
 
    @IBOutlet weak var iv: UIImageView!
    
   
       override func viewDidLoad() {
        super.viewDidLoad()
         kay.becomeFirstResponder()
        kay.delegate = self
          
    slowo = word;
     
    var sum = 160
    
    let a = slowo.characters.count
        for i in 1...a
         {
            sum = sum + 10 * i
            let label: UILabel = UILabel()
            label.frame = CGRect(x:  0 + 20 * i, y: 130 , width:20, height: 30)
            label.text = "_"
            self.view.addSubview(label)
        //self.haslo.text = "_ _ _ _ _ _ _"
        }
        // Do any additional setup after loading the view.
       
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var disabledCharacters = String()
         disabledCharacters = "123"
                   
            if (disabledCharacters.contains(textField.text!)) {
                print("Can't use that character dude :/")
                return false
            
        }
        
        return true
    }
    @IBAction func edit(_ sender: UITextField) {
        print(kay.text)
        if(czybylo.contains(kay.text!)){
        kay.text = ""}
    }
    
    var pom = 0
    var toWin = 6
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        //textField.resignFirstResponder()
        if(textField.text != " "){
        if(pom < 7){
           czybylo = czybylo + textField.text!
            
            var pom2 = 0
        print(textField.text)
       // slowo = "fokolak";
       // let a = slowo.characters.count
        
        if( slowo.contains(textField.text!))
        {
        print("jest")
            toWin = toWin - 1
            if(toWin == 1){
                print("Wygrana!!!!!")
                let alert = UIAlertController(title: "Wygrana",
                                              message: "",
                                              preferredStyle: .alert)
                let dismissHandler = {
                    (action: UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                }
                
                alert.addAction(UIAlertAction(title: "Powrót",
                                              style: UIAlertActionStyle.default){ action -> Void in
                                                print("qqqqqqqq")
                                                // Put your code here
                                                if let navController = self.navigationController {
                                                    navController.popViewController(animated: true)
                                                }
                })
                present(alert, animated: true, completion: nil)
            }
            var sum = 160
            var i = 1
            for character in slowo.characters {
                sum = sum + 10 * i
                let label: UILabel = UILabel()
                label.frame = CGRect(x:  0 + 20 * i, y: 130 , width:20, height: 30)
                if(textField.text == character.description){
                    label.text = textField.text}
                else{
                label.text = "_"}
                i=i+1
                self.view.addSubview(label)            }        }
        else
        {
            pom = pom + 1
            iv.image = UIImage(named: "images/hang" + pom.description + ".png")
            if(pom == 6){
                let alert = UIAlertController(title: "Porażka",
                                              message: "",
                                              preferredStyle: .alert)
                let dismissHandler = {
                    (action: UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                }

                alert.addAction(UIAlertAction(title: "Powrót",
                                              style: UIAlertActionStyle.default){ action -> Void in
                                                print("qqqqqqqq")
                                                if let navController = self.navigationController {
                                                    navController.popViewController(animated: true)
                                                }                                             // Put your code here
                })
                present(alert, animated: true, completion: nil)            }
            
            }
      /*  for character in slowo.characters
        {
      
        if(textField.text != character.debugDescription )
        {
            
            pom2 = pom2 + 1
            print(character.debugDescription)
           
        }
        else  if(textField.text == character.debugDescription ){
                pom2 = pom2 - 1
            // print(pom2)
            }
         
        }*/
     }
    }
        kay.text = ""
        return true
        
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.utf16.count + string.utf16.count - range.length
        return newLength <= 1 // Bool
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

};
