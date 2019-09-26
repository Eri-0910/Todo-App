//
//  TodoTableViewCell.swift
//  testTodoApp
//
//  Created by 山河絵利奈 on 8/24/19.
//  Copyright © 2019 山河絵利奈. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

   
    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todoComment: UILabel!
    @IBOutlet weak var todoDay: UILabel!
    
    var todo_title: String?
    var todo_comment: String?
    var todo_day: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        todoTitle.text = todo_title
        todoComment.text = todo_comment
        todoDay.text = todo_day

    }

}
