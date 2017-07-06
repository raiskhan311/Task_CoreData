//
//  AddTaskViewController.swift
//  Employee_CoreData
//
//  Created by mac on 06/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class AddTaskViewControlle: UIViewController {
    
    
    @IBOutlet weak var txt_EnterText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_AddTextToDataBase(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = txt_EnterText.text
        
         // Save the data to CoreData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        _ = navigationController?.popViewController(animated: true)
    }

}

