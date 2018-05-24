//
//  RandomSongViewController.swift
//  EMWorship
//
//  Created by Jarvis Flores on 5/22/18.
//  Copyright © 2018 Jarvis Flores. All rights reserved.
//

import UIKit
var randomSelected = ""

class RandomSongViewController: UIViewController {

   
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var size = 0
    
    
    @IBAction func bSong1(_ sender: Any) {
        randomSelected = (button1.titleLabel?.text)!
    }
    
    @IBAction func bSong2(_ sender: Any) {
        randomSelected = (button2.titleLabel?.text)!
    }
    
    
    
    @IBAction func bSong3(_ sender: Any) {
        randomSelected = (button3.titleLabel?.text)!
    }
    
    
    
    @IBOutlet weak var refresh: UIButton!
    
    @IBAction func randomizeAgain(_ sender: Any) {
        self.again()
    }
    
    var randomArray: [Int] = []
    var temp: [String] = []
    var s1 = 0
    var s2 = 0
    var s3 = 0
    
    
    
    func readfile(){
        let t = "praise"
        //print(t)
        do {
            
            if let path = Bundle.main.path(forResource: "\(t)", ofType: "txt")
            {
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                temp = data.components(separatedBy: "\n")
            }
        } catch let error as NSError {
            // do something with Error
            print(error)
        }
        size = temp.count-1
    }
    
    func randomize (){
       
        s1 = Int(arc4random_uniform(UInt32(size)))
        randomArray.append(s1)
        s2 = Int(arc4random_uniform(UInt32(size)))
        while s2 == s1
        {
             s2 = Int(arc4random_uniform(UInt32(size)))
        }
       randomArray.append(s2)
        s3 = Int(arc4random_uniform(UInt32(size)))
        while s3 == s2 || s3 == s1
        {
            s3 = Int(arc4random_uniform(UInt32(size)))
        }
        randomArray.append(s3)
       // print(temp.count)
    }
    
    
    func again (){
        readfile()
        randomize()
//        song1.text = temp[randomArray[0]]
//        song2.text = temp[randomArray[1]]
//        song3.text = temp[randomArray[2]]
        button1.setTitle(temp[randomArray[0]], for: .normal)
        button2.setTitle(temp[randomArray[1]], for: .normal)
        button3.setTitle(temp[randomArray[2]], for: .normal)
        randomArray.removeAll()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readfile()
        randomize()
//        song1.text = temp[randomArray[0]]
//        song2.text = temp[randomArray[1]]
//        song3.text = temp[randomArray[2]]
        button1.setTitle(temp[randomArray[0]], for: .normal)
        button2.setTitle(temp[randomArray[1]], for: .normal)
        button3.setTitle(temp[randomArray[2]], for: .normal)
        randomArray.removeAll()
        //self.again()
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
