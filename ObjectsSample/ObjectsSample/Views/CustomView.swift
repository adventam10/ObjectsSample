//
//  CustomView.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/13.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class CustomView: XibLoadView {
}

class XibLoadView: UIView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    private func loadNib() {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as! UIView
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
