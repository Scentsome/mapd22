//
//  ViewController.swift
//  PdfDemo
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    var document:PDFDocument!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var filePath:String = Bundle.main.path(forResource: "10_mission_3_password", ofType: "pdf")!
        var fileURL = URL(fileURLWithPath: filePath)
        document = PDFDocument(url: fileURL)
        
        self.pdfView.document = document
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

