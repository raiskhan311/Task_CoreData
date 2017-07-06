//
//  TableViewController.swift
//  Employee_CoreData
//
//  Created by mac on 06/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks:[Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        return cell
    }
    // MARK : - Edit Table View Cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do
            {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch
            {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }
    // MARK :- Creat function for Get Data from CoreData
    func getData(){
        do
        {
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch
        {
            print("fetching field")
        }
    }

}
