//
//  BarViewController.swift
//  ChartDemo
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import Charts

class BarViewController: UIViewController {
    @IBOutlet weak var barChartView: BarChartView!
    
    @IBAction func hightlight(_ sender: Any) {
        
        self.barChartView.highlightValue(x: 5, dataSetIndex: 0, stackIndex: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData(){
        let values = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        var dataEntries:[BarChartDataEntry] = []
        
        for (index,value) in values.enumerated() {
            let entry = BarChartDataEntry(x: Double(index), y:  Double(value))
            dataEntries.append(entry)
        }
        let dataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let barChartData = BarChartData(dataSets: [dataSet])
        self.barChartView.data = barChartData
        
        var colors:[UIColor] = []
        colors.append(contentsOf: ChartColorTemplates.colorful())
        dataSet.colors = colors
        self.barChartView.xAxis.labelPosition = .bottomInside
        
        let limitLine = ChartLimitLine(limit: 11.0, label: "Target")
        self.barChartView.rightAxis.addLimitLine(limitLine)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
