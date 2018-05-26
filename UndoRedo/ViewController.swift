//
//  ViewController.swift
//  UndoRedo
//
//  Created by holgermayer on 26.05.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var item : Item?
  
    private var _undoManager = UndoManager()
    override var undoManager: UndoManager {
        return _undoManager
    }
    
    @IBOutlet weak var redoButton: UIBarButtonItem!
    @IBOutlet weak var undoButton: UIBarButtonItem!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.item = Item(undoManager: self.undoManager)
        self.valueLabel?.text = "\((self.item?.y)!)"
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func undoAction(_ sender: Any) {
        self.undoManager.undo()
        self.valueLabel?.text = "\((self.item?.y)!)"
    }
    
    @IBAction func redoAction(_ sender: Any) {
        self.undoManager.redo()
        self.valueLabel?.text = "\((self.item?.y)!)"
   }
    
    @IBAction func upAction(_ sender: Any) {
        self.item?.y = (self.item?.y)! + 1
        self.valueLabel?.text = "\((self.item?.y)!)"
    }
    @IBAction func downAction(_ sender: Any) {
        self.item?.y = (self.item?.y)! - 1
        self.valueLabel?.text = "\((self.item?.y)!)"
   }
}

