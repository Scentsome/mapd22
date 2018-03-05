//
//  ContractsTableViewController.swift
//  PDFKit_swift
//
//  Created by cora on 2018/3/2.
//  Copyright © 2018年 cora. All rights reserved.
//

import UIKit
import PDFKit

class ContractsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DocumentViewControllerDelegate {
    
    var documents:Array<NSString>! = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDocuments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = documents[indexPath.row].lastPathComponent

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return documents.count
    }
    
    func didSaveDocument() {
    
        loadDocuments()
    }
    
    func loadDocuments() {
        do {
            documents = try FileManager.default.contentsOfDirectory(atPath: contractsDirectory()) as Array<NSString>
        } catch {
            print("Load Error")
        }
        print(documents)
        tableView.reloadData()
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
        print(contractsPath)
        return contractsPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewContractSegue" {
            
            let vc:DocumentViewController = segue.destination as! DocumentViewController
            let pdfPath:String = Bundle.main.path(forResource: "contractTemplate", ofType: "pdf")!
            vc.document = PDFDocument(url: URL(fileURLWithPath: pdfPath))
            vc.title = "New Contract"
            vc.addAnnotations = true
            vc.delegate = self
        }
        if segue.identifier == "CurrentContractSegue" {
            
            let vc:DocumentViewController = segue.destination as! DocumentViewController
            let document:NSString = documents[tableView.indexPath(for: sender as! UITableViewCell)!.row]
            vc.addAnnotations = false
            vc.title = document as String
            let url:URL = URL(fileURLWithPath: contractsDirectory()).appendingPathComponent(document as String)
            let data = NSData(contentsOfFile: url.path)
            vc.document = PDFDocument(data: data! as Data)
            vc.delegate = self
        }
    }
}
