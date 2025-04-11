//
//  CompressBox.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

import UIKit
import SnapKit

class CompressBox: UIView {

    var zeroHeight: Constraint!
    var zeroWidth: Constraint!

    var isHeightCompressed: Bool {
        return zeroHeight.isActive
    }

    var isWidthCompressed: Bool {
        return zeroWidth.isActive
    }

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        clipsToBounds = true

        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeConstraints() {
        snp.makeConstraints { (make) in
            zeroHeight = make.height.equalTo(0).constraint
            zeroWidth = make.width.equalTo(0).constraint
        }

        zeroHeight.deactivate()
        zeroWidth.deactivate()
    }

    func compressWidth() {
        zeroWidth.activate()
    }

    func expandWidth() {
        zeroWidth.deactivate()
    }

    func toggleWidth() {
        zeroWidth.isActive ? zeroHeight.deactivate() : zeroHeight.activate()
    }

    func compressHeight() {
        zeroHeight.activate()
    }

    func expandHeight() {
        zeroHeight.deactivate()
    }

    func toggleHeight() {
        zeroHeight.isActive ? zeroHeight.deactivate() : zeroHeight.activate()
    }

}
