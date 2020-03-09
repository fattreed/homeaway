//
//  EventViewController.swift
//  HomeAwayUIKit
//
//  Created by matty on 3/7/20.
//  Copyright © 2020 matty. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var cityStateLabel: UILabel!
    
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = event.title
        cityStateLabel.text = "\(event.venue?.city ?? ""), \(event.venue?.state ?? "")"
        if let date = event.datetimeLocal {
            let dateString = DateFormatter.displayFormatter.string(from: date)
            dateLabel.text = dateString
        }
        if let image = event.performers.first?.image {
            imageView.kf.setImage(with: image)
        }
    }
}
