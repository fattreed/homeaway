//
//  EventCell.swift
//  HomeAwayUIKit
//
//  Created by matty on 3/7/20.
//  Copyright © 2020 matty. All rights reserved.
//

import UIKit
import Kingfisher

class EventCell: UITableViewCell {
    @IBOutlet private var eventImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var cityStateLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    func configure(with event: Event) {
        titleLabel.text = event.title
        cityStateLabel.text = "\(event.venue?.city ?? ""), \(event.venue?.state ?? "")"
        if let date = event.datetimeLocal {
            let dateString = DateFormatter.displayFormatter.string(from: date)
            dateLabel.text = dateString
        }
        if let image = event.performers.first?.image {
            eventImageView.kf.setImage(with: image)
        }
    }
}
