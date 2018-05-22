//
//  ViewController.swift
//  EMWorship
//
//  Created by Jarvis Flores on 5/11/18.
//  Copyright © 2018 Jarvis Flores. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
    
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var textBox: UITextView!
    var arrayOfStrings: [String] = []

    
    
    
    
    override func viewDidLoad()
    {
        
        songTitle.text = s
        let temp:String  = String("\(s)")
        print(temp)
     
        //let trimmed = temp.replacingOccurrences(of: "^\\n*", with: "", options: .regularExpression)
       // print("trimmed = ", trimmed)
        var fileName = String(temp.filter { !"\n\r".contains($0) })
      // print ("test = ",test)
        
        do {

            if let path = Bundle.main.path(forResource: "\(fileName)", ofType: "txt")
                {
                    let data = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                    texter = data.components(separatedBy: "\n")
                }
            } catch let error as NSError {
                        // do something with Error
                print(error)
            }
        
        //print(songTitle.text ?? String.self)
        //print("temp = ", temp)
        //print (temp)
        var text = ""
        var selectedArray = [String](texter)
        for index in 0..<selectedArray.count {
            text += "\(selectedArray[index])\n"
            
        }
        print("s=", s)
        print("FN=" ,fileName)
        if(s == fileName){
            print("T")

        }
        else{
            print("F")
        }
        textBox.text = text
        text = ""
        fileName = ""
        
        
       
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

