//
//  ViewController.swift
//  ChartDemo
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBAction func doRotation(_ sender: Any) {
        self.pieChartView.rotationAngle = 45
//        self.pieChartView.

    }
    @IBOutlet weak var rotate: UIButton!
    @IBAction func highlight(_ sender: Any) {
        pieChartView.highlightValue(x: 2, y: 1, dataSetIndex: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChartView.noDataText = "沒有資料"
        pieChartView.delegate = self
        setupData()
    }
    func setupData()  {
        let pieChartRawData:Dictionary = ["iOS 8":84, "iOS 7":14, "Earlier":20]
        var yValues:[PieChartDataEntry] = []
        for (label, value) in pieChartRawData {
            let entry:PieChartDataEntry = PieChartDataEntry(value: Double(value), label: label)
            yValues.append(entry)
       }
        let dataSet = PieChartDataSet(values: yValues, label: "Units Sold")
        
        let pieChartData:PieChartData = PieChartData(dataSet: dataSet)
        
        self.pieChartView.data = pieChartData
        
        var colors:[UIColor] = []
        colors.append(contentsOf: ChartColorTemplates.colorful())
        dataSet.colors = colors
        
        var pFormatter:NumberFormatter = NumberFormatter()
        pFormatter.numberStyle = .decimal
        pFormatter.maximumFractionDigits = 2
        pFormatter.multiplier = 1
//        pFormatter.percentSymbol = "%"
    pieChartData.setValueFormatter(DefaultValueFormatter(formatter:pFormatter))
        
        pieChartData.setValueFont(UIFont(name: "Helvetica", size: 22))
            
        pieChartData.setValueTextColor(UIColor.blue)
        
    }
    override func viewDidAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight){
        print(entry)
    }
    
    // Called when nothing has been selected or an "un-select" has been made.
    func chartValueNothingSelected(_ chartView: ChartViewBase){
        print("Nothing selected")
    }
}

