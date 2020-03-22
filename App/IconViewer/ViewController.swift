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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(KTDIcons.allCases.count) - 1
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: IconCell = self.tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath) as! IconCell
        
        cell.setup(icon: KTDIcons(rawValue: UInt16(indexPath.row + 1))!)
        
        return cell
    }

}

