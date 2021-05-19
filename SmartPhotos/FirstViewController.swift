//
//  FirstViewController.swift
//  SmartPhotos
//
//  Created by Aaryaman Saini on 17/05/21.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var globalButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        globalButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        globalButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        globalButton.layer.shadowOpacity = 1.0
        globalButton.layer.shadowRadius = 0.0
        globalButton.layer.masksToBounds = false
        globalButton.layer.cornerRadius = 15.0
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
