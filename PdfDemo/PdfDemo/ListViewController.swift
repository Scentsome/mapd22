//
//  ListViewController.swift
//  PdfDemo
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import PDFKit

class ListViewController: UITableViewController, DocumentViewControllerDelegate {
    var data:[(String,Bool)] = ["1","2","3","4","5","6","7","8","11","12","13","14","21","22","23","24","31","32","33","34","13","14","21","22","23","24","31","32","33","34"].map { (str) -> (String,Bool) in
        return (str,false)
    }
    var documents:Array<NSString>! = []
    
    
//    func contractsDirectory() {
//        print(NSHomeDirectory())
//        let contractsURL:URL = URL(fileURLWithPath:
//            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//                .appending("contracts"))
//        print(contractsURL)
//    }
    
    func contractsDirectory() -> String {
        
        let contractsURL:URL = URL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                .appending("contracts"))
        
        let contractsPath:String = String(format:"%@",contractsURL.path)
        
        if (!FileManager.default.fileExists(atPath: contractsPath)) {
            do {
                try FileManager.default.createDirectory(atPath: contractsPath,withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Create Error")
            }
        }
        return contractsPath;
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
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
            for: indexPath)
        cell.textLabel?.text = documents[indexPath.row].lastPathComponent

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        data[indexPath.row].1 = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==
            "NewContractSegue" {
            let vc:ViewController = segue.destination as! ViewController
            let pdfPath:String = Bundle.main.path(forResource: "contractTemplate", ofType: "pdf")!
            vc.document = PDFDocument(url: URL(fileURLWithPath: pdfPath))
            vc.title = "New Contract"
            vc.addAnnotations = true
            vc.delegate = self
        }
        if segue.identifier ==
        "CurrentContractSegue" {
            let vc:ViewController = segue.destination as! ViewController
            let document:NSString = documents[tableView.indexPath(for: sender as! UITableViewCell)!.row]
            vc.addAnnotations = false
            vc.title = document as String
            let url:URL = URL(fileURLWithPath: contractsDirectory())
                .appendingPathComponent(document as String)
            let data = NSData(contentsOfFile: url.path)
            vc.document = PDFDocument(data: data! as Data)
            vc.delegate = self
            
        }

    }

}
