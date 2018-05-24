//
//  RandomSongLyricsViewController.swift
//  EMWorship
//
//  Created by Jarvis Flores on 5/22/18.
//  Copyright © 2018 Jarvis Flores. All rights reserved.
//

import UIKit

class RandomSongLyricsViewController: UIViewController {
    
    
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var textBox: UITextView!
    
    @IBAction func Youtbue(_ sender: Any) {
        var linkName: String = String("\(randomSelected)")
        linkName = linkName+" Link"
        let t = String(linkName.filter { !"\n\r".contains($0) })
        
        do {
            
            if let path = Bundle.main.path(forResource: "\(t)", ofType: "txt")
            {
                let data = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                texter = data.components(separatedBy: "\n")
            }
        } catch let error as NSError {
            // do something with Error
            print(error)
        }
        print(texter)
        let split = texter[0]
        
        
        
        UIApplication.shared.open(URL(string:"\(split)")! as URL, options: [:], completionHandler: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        songTitle.text = randomSelected
        let temp:String  = String("\(randomSelected)")
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
        //print("s=", s)
        //print("FN=" ,fileName)
//        if(s == fileName){
//            print("T")
//
//        }
//        else{
//            print("F")
//        }
        textBox.text = text
        text = ""
        fileName = ""
        
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
