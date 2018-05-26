//
//  Item.swift
//  UndoRedo
//
//  Created by holgermayer on 26.05.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class Item {
    private var undoManager : UndoManager?
    private var x : Int
    public  var y : Int {
        willSet {
            if let undo = undoManager {
                let oldValue = y
                undoManager?.registerUndo(withTarget: self) { $0.y = oldValue }
                undo.setActionName("set y")
            }
        }
    }
    
    func setX(_ xValue : Int) {
        let oldValue = self.x
        if let undo = undoManager {
            undo.registerUndo(withTarget: self) { target in
                target.setX(oldValue)
            }
        }
        self.x = xValue
    }
    
    func getX() -> Int {
        return self.x
    }
    
    init(undoManager : UndoManager?) {
        x = 1
        y = 1
        self.undoManager = undoManager
    }
}
