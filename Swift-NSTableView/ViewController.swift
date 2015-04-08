//
//  ViewController.swift
//  Swift-NSTableView
//
//  Created by Mathieu Savy on 08/04/2015.
//  Copyright (c) 2015 Mathieu Savy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var tableView: NSTableView!
    
    var data: [[String: String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [
            [
                "name": "XCode",
                "description": "XCode is an amazing IDE",
                "image": "xcode-6.png"
            ],
            [
                "name": "WebStorm",
                "description": "Webstorm is amazing for web development",
                "image": "webstorm.png"
            ]
        ];
        
        let nib = NSNib(nibNamed: "MyCellView", bundle: NSBundle.mainBundle())
        tableView.registerNib(nib!, forIdentifier: "MyCellView")
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return data!.count
    }
    
    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeViewWithIdentifier("MyCellView", owner: self) as MyCellView
        let item: [String: String] = (data!)[row]
        
        cell.itemName.stringValue = item["name"]!
        cell.itemDescription.stringValue = item["description"]!
        cell.itemImage.image = NSImage(named: item["image"]!)
        
        return cell
    }

}

