//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Tamer Shahin on 30/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var subtaskTextFields: UITextField!

    var detailTaskModel: TaskModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println(self.detailTaskModel.task)
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextFields.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
