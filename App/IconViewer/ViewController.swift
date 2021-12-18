//
//  ViewController.swift
//  IconViewer
//
//  Created by Kyle Donnelly on 3/19/20.
//  Copyright © 2020 Kyle Donnelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(KTDIcons.allCases.count) - 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Images"
        case 1: return "Buttons"
        case 2: return "SwiftUI"
        default: preconditionFailure()
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "IconImageCell", for: indexPath) as! IconImageCell
            cell.setup(icon: KTDIcons.allCases[indexPath.row + 1])
            return cell
        case 1:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "IconButtonCell", for: indexPath) as! IconButtonCell
            cell.setup(icon: KTDIcons.allCases[indexPath.row + 1])
            return cell
        case 2:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "IconHostingCell", for: indexPath) as! IconHostingCell
            cell.setup(icon: KTDIcons.allCases[indexPath.row + 1], parentController: self)
            return cell
        default:
            preconditionFailure()
        }
    }

}

