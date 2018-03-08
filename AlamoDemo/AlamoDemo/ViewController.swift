//
//  ViewController.swift
//  AlamoDemo
//
//  Created by Michael on 06/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    let hostURI = "http://localhost:8080"
    
    
    @IBAction func getJSON(_ sender: Any) {
        let parameters: Parameters = ["name": "michael", "age":"45"]
        Alamofire.request(hostURI + "/filter", method: .get, parameters: parameters, encoding: URLEncoding.default)
            .responseJSON { response in
                debugPrint(response.value)
        }
    }
    
    @IBAction func getMETHOD(_ sender: Any) {
//        Alamofire.request(hostURI+"/console").response { response in
//
//            var html = String(data: response.data!, encoding: .utf8)
//            print("\(html)")
//        }
        Alamofire.request(hostURI+"/book").responseJSON { (response) in
            let hello:[String:[String:String]] = response.value as! [String:[String:String]]
            print("\(hello["info"]!["Author"])")
        }
        
        
        

    }
    
    @IBAction func uploadImage(_ sender: Any) {
        let image = UIImage(named:"cat.jpg")
        let data:Data = UIImageJPEGRepresentation(image!, 0.5)!
        
        requestWith(endUrl: hostURI+"/upload", imageData: data, parameters: [:])
        
    }
    
    func requestWith(endUrl: String, imageData: Data?, parameters: [String : Any] ){
        let url = endUrl
        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            if let data = imageData{
                multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
            }
        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print("Succesfully uploaded")
                    if let err = response.error{
                        print("Error in upload:" )
                        return
                    }
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
            }
        }
    }
    @IBAction func postMETHOD(_ sender: Any) {
        var postURL = hostURI + "/updateInfo"
        let params = [
            "user":"michael",
            "age":"23"
            ] as [String : Any]
        Alamofire.request(postURL, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                debugPrint(response)
                
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var urlString = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=9d6b643e-5d71-46e7-8368-eb0aaf907171"
        
        Alamofire.request(urlString).responseJSON { (response) in
            do {
                var openData:OpenData = try JSONDecoder().decode( OpenData.self, from: response.data!)
                
                print(openData.result.results[1].機構地址)
            } catch {
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

