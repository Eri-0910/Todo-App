//
//  TodoTableViewCell.swift
//  testTodoApp
//
//  Created by 山河絵利奈 on 8/25/19.
//  Copyright © 2019 山河絵利奈. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todo_title: UILabel!
    @IBOutlet weak var todo_comment: UILabel!
    @IBOutlet weak var todo_day: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String, comment: String, day: Date) {
        
        todo_title.text = title
        todo_comment.text = comment
        todo_day.text = "\(day)"
    }
    
}
