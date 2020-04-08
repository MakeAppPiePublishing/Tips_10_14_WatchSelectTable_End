//
//  InterfaceController.swift
//  SelectionTable WatchKit Extension
//
//  Created by Steven Lipton on 4/7/20.
//  Copyright © 2020 Steven Lipton. All rights reserved.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 10 (Q2 2020) video 14
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  How to highlight the background of a cell in a WatchKit table
//  For more code, go to http://bit.ly/AppPieGithub

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    //custom colors
    let myRed = UIColor(red: 0.75, green: 0.10, blue:0.1,alpha:1.0)
    let myGreen = UIColor(red: 0.0, green: 0.5, blue:0.0,alpha:1.0)
    
    let menu = MenuModel.menu
    @IBOutlet weak var table: WKInterfaceTable!
    @IBOutlet weak var selectedLabel: WKInterfaceLabel!
    
    func loadTable(){
        table.setNumberOfRows(menu.count, withRowType: "row")
        for index in 0..<menu.count{
            let row = self.table.rowController(at: index) as! RowController
            row.menuLabel.setText(menu[index].name)
            row.menuImage.setImageNamed(String(format:"%i_100w",index))
            row.rowGroup.setBackgroundColor(myRed)
        }
    }
    
    func setTable(_ table: WKInterfaceTable, atSelectedRow rowIndex:Int){
        for index in 0..<table.numberOfRows{
            let row = table.rowController(at: index) as! RowController
            if index == rowIndex{
                row.rowGroup.setBackgroundColor(myGreen)
                
            } else {
                row.rowGroup.setBackgroundColor(myRed)
            }
            
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        selectedLabel.setText(menu[rowIndex].name)
        setTable(table,atSelectedRow: rowIndex)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTable()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}



/// The outlets for the Rows. Placed here for use with Story board control-dragging
class RowController:NSObject{
    @IBOutlet weak var menuImage: WKInterfaceImage!
    @IBOutlet weak var menuLabel: WKInterfaceLabel!
    
    @IBOutlet weak var rowGroup: WKInterfaceGroup!
}
