//
//  ViewController.swift
//  some charts
//
//  Created by Elizabeth Chan on 10/10/2017.
//  Copyright © 2017 Elizabeth Chan. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    var numArray: [Double] = []
    var dateArray: [String] = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]

    var date2Array: [String] = []
    

    @IBAction func submit(_ sender: Any) {
        let numDouble = Double(textInput.text!)
        numArray.append(numDouble!)
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat="dd MMM"
        let result = formatter.string(from: date)
        print(result)
        date2Array.append(result)
        updateGraph()
    }
    
    func updateGraph() {
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<numArray.count{
           let value = ChartDataEntry(x: Double(i), y: numArray[i])
            lineChartEntry.append(value)
        }
        
//        lineChartEntry = [ChartDataEntry(x: 0.0, y: 2.0)]
        print("look here.............................")

        print(lineChartEntry)
        
 

        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Mood")
        
        line1.colors = [NSUIColor.red]
        
        let data = LineChartData()
        
        data.addDataSet(line1)
        
        chtChart.data = data
    
        
        chtChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:date2Array)
        chtChart.xAxis.granularity = 1

        
        
    }
    
    @IBOutlet weak var chtChart: LineChartView!
    
    @IBOutlet weak var textInput: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

