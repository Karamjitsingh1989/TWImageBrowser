//
//  ViewController.swift
//  TWImageBrowser
//
//  Created by Tae Woo Kang on 05/26/2016.
//  Copyright (c) 2016 magicmon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    fileprivate let kTestCellMenuIdentifier = "kTestCellMenuIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: kTestCellMenuIdentifier)
        var cell: UITableViewCell? = nil
        
        if let dequeuedCell = dequeuedCell {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: kTestCellMenuIdentifier)
            cell?.selectionStyle = .gray
        }
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "Normal Type (Image)"
        case 1:
            cell?.textLabel?.text = "Normal Type (GIF)"
        case 2:
            cell?.textLabel?.text = "Browser Type"
        default:
            break
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "NormalController") {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        case 1:
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "GIFViewController") {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        case 2:
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "BannerController") {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        default:
            break
        }

        
    }
}

