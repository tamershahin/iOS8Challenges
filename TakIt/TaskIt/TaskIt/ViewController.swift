//
//  ViewController.swift
//  TaskIt
//
//  Created by Tamer Shahin on 30/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var taskArray:[TaskModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let date3 = Date.from(year: 2014, month: 12, day: 13)


        // Do any additional setup after loading the view, typically from a nib.
        let task1:TaskModel = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2:TaskModel = TaskModel(task:  "Eat Dinner", subTask: "Burgers", date: date2)
        let task3:TaskModel = TaskModel(task:  "Gym", subTask: "Leg day", date: date3)
        taskArray = [task1, task2, task3]

        self.tableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }

    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell

        cell.taskLabel.text = taskArray[indexPath.row].task
        cell.descriptionLabel.text = taskArray[indexPath.row].subTask
        cell.dateLabel.text =  Date.toString(date: taskArray[indexPath.row].date)
        return cell
    }

    //UITableViewDelegate
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
        
    }
}

