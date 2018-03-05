//
//  ViewController.swift
//  PdfDemo
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import PDFKit


protocol DocumentViewControllerDelegate {
    func didSaveDocument()
}
class ViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    var document:PDFDocument!
    var addAnnotations:Bool!
    var delegate:DocumentViewControllerDelegate!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var filePath:String = Bundle.main.path(forResource: "10_mission_3_password", ofType: "pdf")!
//        var fileURL = URL(fileURLWithPath: filePath)
//        document = PDFDocument(url: fileURL)
//
//        self.pdfView.document = document
        
        pdfView.displayMode = .singlePageContinuous
        pdfView.displaysPageBreaks = true
        pdfView.autoScales = true
        pdfView.document = document
        if(addAnnotations){
            addContractAnnotations()
        }
    }
    func addContractAnnotations() {
        
        let page:PDFPage = document.page(at: 0)!
        let pageBounds:CGRect = page.bounds(for: .cropBox)
        let checkBoxAgreeBounds:CGRect = CGRect(x: 75, y: pageBounds.size.height - 375,
                                                width: 18, height: 18)
        let checkBox:PDFAnnotation = PDFAnnotation(bounds: checkBoxAgreeBounds,forType: .widget,
                withProperties: nil)
        checkBox.widgetFieldType = .button
        checkBox.widgetControlType = .checkBoxControl
        page.addAnnotation(checkBox)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

