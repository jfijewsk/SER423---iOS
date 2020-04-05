//
//  AddPlaceViewController.swift
//  Assign6jfijewsk
//
//  Created by James on 4/5/20.
//  Copyright © 2020 James. All rights reserved.
//

import UIKit

class AddPlaceViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressTitleText: UITextField!
    @IBOutlet weak var addressText1: UITextField!
    @IBOutlet weak var addressText2: UITextField!
    @IBOutlet weak var addressText3: UITextField!
    
    @IBOutlet weak var elevationText: UITextField!
    @IBOutlet weak var latitudeText: UITextField!
    @IBOutlet weak var longitudeText: UITextField!
    @IBOutlet weak var imageText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var categoryText: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionText!.layer.borderWidth = 1
        descriptionText!.layer.borderColor = UIColor.lightGray.cgColor

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }



}
