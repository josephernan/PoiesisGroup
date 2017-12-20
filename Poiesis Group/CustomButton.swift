//
//  CustomBtn.swift
//  Doctor
//
//  Created by admin on 18/11/2017.
//  Copyright © 2017 POLARIS. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton
{
    var normalBtnImage = "btn_bk"
    var highlightedBtnImage = "btn_bk2"

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitleColor( UIColor.black, for: .normal )
        self.setBackgroundImage( UIImage(named: self.normalBtnImage)?.withRenderingMode(.alwaysOriginal), for: .normal )
        self.setBackgroundImage( UIImage(named: self.highlightedBtnImage)?.withRenderingMode(.alwaysOriginal), for: .highlighted )
    }
}
