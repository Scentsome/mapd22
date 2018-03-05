//
//  LineViewController.swift
//  ChartDemo
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import Charts

class LineViewController: UIViewController {
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupData(){
        let values = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        var dataEntries:[ChartDataEntry] = []
        
        for (index,value) in values.enumerated() {
            let entry = ChartDataEntry(x: Double(index), y:  Double(value))
            dataEntries.append(entry)
        }
        var dataSet = LineChartDataSet(values: dataEntries, label: "Units Sold")
        
        dataSet.colors = [UIColor.blue]
        var chartData = LineChartData(dataSets: [dataSet])
        self.lineChartView.data = chartData
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
