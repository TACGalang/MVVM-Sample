//
//  TableViewExtensions.swift
//
//  Created by Tristan Galang on 09/07/2018.
//  Copyright © 2018 Binary Digital. All rights reserved.
//

import UIKit

public extension UITableView {
    
    /** Reload tableView with specific animations. */
    public func reloadData(with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}
