//
//  UIImageView+Extension.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import UIKit
import SnapKit

extension UIImageView {

    func setRatioToImage() {
        guard image != nil else { return }

        let ratio = image!.size.height / image!.size.width
        snp.makeConstraints { (make) in
            make.height.equalTo(snp.width).multipliedBy(ratio)
        }
    }

}
