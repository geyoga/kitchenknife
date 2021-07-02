//
//  ViewController.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIFont.familyNames.forEach({ familyName in
                    let fontNames = UIFont.fontNames(forFamilyName: familyName)
                    print(familyName, fontNames)
                })
    }

}
