//
//  ViewController.swift
//  AlienImageViewTimer03
//
//  Created by D7703_23 on 2019. 3. 28..
//  Copyright © 2019년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var AlienImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    var count = 1
    //TImer 객체 생성
    var myTimer = Timer()
    var isAnimmating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AlienImageView.image = UIImage(named: "image\(count)")
        countLabel.text = String(count)
        
    }
    @IBAction func btnPlay(_ sender: Any) {
        //Timer 작동
        if isAnimmating == true{return}
        else{
            isAnimmating = true
        }
        myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
    }
    
    @IBAction func btnPause(_ sender: Any) {
        myTimer.invalidate()
        
        isAnimmating = false
    }
    
    @IBAction func btnStop(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        isAnimmating = false
    }
    
    @objc func doAnimation(){
        if count == 5{
            count = 0
        }
        count+=1
        AlienImageView.image = UIImage(named: "image\(count)")
        countLabel.text = String(count)
    }
    
}

