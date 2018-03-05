//
//  DocumentViewController.swift
//  PDFKit_swift
//
//  Created by cora on 2018/3/2.
//  Copyright © 2018年 cora. All rights reserved.
//

import UIKit
import PDFKit

protocol DocumentViewControllerDelegate {
    func didSaveDocument()
}

class DocumentViewController: UIViewController {
    
    var document:PDFDocument!
    var addAnnotations:Bool!
    var delegate:DocumentViewControllerDelegate!
    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pdfView.displayMode = .singlePageContinuous
        pdfView.displaysPageBreaks = true
        pdfView.autoScales = true
        pdfView.document = document
        if(addAnnotations){
            addContractAnnotations()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addContractAnnotations() {
        
        let page:PDFPage = document.page(at: 0)!
        let pageBounds:CGRect = page.bounds(for: .cropBox)
        
        let checkBoxAgreeBounds:CGRect = CGRect(x: 75, y:  pageBounds.size.height - 375, width: 18, height: 18)
        let checkBox:PDFAnnotation = PDFAnnotation(bounds: checkBoxAgreeBounds, forType: .widget, withProperties: nil)
        checkBox.widgetFieldType = .button
        checkBox.widgetControlType = .checkBoxControl
        page.addAnnotation(checkBox)
        
        let textFieldNameBounds:CGRect = CGRect(x: 128,y:  pageBounds.size.height - 142, width: 230, height:23)
        let textWidget:PDFAnnotation = PDFAnnotation(bounds: textFieldNameBounds, forType: .widget, withProperties: nil)
        textWidget.widgetFieldType = .text
        textWidget.font = UIFont.systemFont(ofSize: 18)
        textWidget.fieldName = "name"
        page.addAnnotation(textWidget)
        
        let radioButtonBounds:CGRect = CGRect(x: 105,y:  pageBounds.size.height - 285, width: 18, height:18)
        let radioButton:PDFAnnotation = PDFAnnotation(bounds: radioButtonBounds, forType: .widget, withProperties: nil)
        radioButton.widgetFieldType = .button
        radioButton.widgetControlType = .radioButtonControl
        radioButton.fieldName = "WEEK"
        radioButton.buttonWidgetStateString = "Sun"
        page.addAnnotation(radioButton)

        //ClearButton
        let clearButtonBounds:CGRect = CGRect(x: 75, y: pageBounds.size.height - 450, width: 106,height: 32)
        let clearButton:PDFAnnotation = PDFAnnotation(bounds: clearButtonBounds, forType: .widget, withProperties: nil)
        clearButton.widgetFieldType = .button
        clearButton.widgetControlType = .pushButtonControl
        clearButton.caption = "Clear"
        clearButton.fieldName = "clearButton"
        page.addAnnotation(clearButton)
        //ClearButton Action
        let resetFormAction:PDFActionResetForm = PDFActionResetForm()
        resetFormAction.fields = ["colaPrice", "rrPrice"]
        resetFormAction.fieldsIncludedAreCleared = false
        clearButton.action = resetFormAction

    }
    
    @IBAction func saveAnnotation(_ sender: Any) {
        
        let page:PDFPage = document.page(at: 0)!

        var contracteeName:String = ""
        
        for annotation in page.annotations {
            
            if (annotation.fieldName == "clearButton") {
                
                page.removeAnnotation(annotation)
                
            } else if (annotation.fieldName == "name" && annotation.value(forAnnotationKey: .widgetValue) != nil) {
                
                contracteeName = annotation.value(forAnnotationKey: .widgetValue) as! String
            }
        }
        
        if (contracteeName != "") {
            
            var displayName:String = contracteeName.replacingOccurrences(of: " ", with: "_")
            displayName = String(format:"/%@.pdf",displayName)
            let savePathURL:URL = URL(fileURLWithPath: contractsDirectory().appending(displayName))
            print("savePathURL ",savePathURL)
            document.write(to: savePathURL)
            delegate.didSaveDocument()
            navigationController?.popViewController(animated: true)
        } else {
            print("Full Name is empty!!!")
        }
    }
    
    func contractsDirectory() -> String {
        
        let contractsURL:URL = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].appending("contracts"))
        
        let contractsPath:String = String(format:"%@",contractsURL.path)
        
        if (!FileManager.default.fileExists(atPath: contractsPath)) {
            do {
                try FileManager.default.createDirectory(atPath: contractsPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Create Error")
            }
        }
        return contractsPath;
    }
    

}
