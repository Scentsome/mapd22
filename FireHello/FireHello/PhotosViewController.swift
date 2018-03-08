//
//  PhotosViewController.swift
//  FireHello
//
//  Created by Michael on 08/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import FirebaseDatabase
class PhotosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var fireUploadDic: [String:Any]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let databaseRef = Database.database().reference().child("ImageFireUpload")
        
        databaseRef.observe(.value, with: { [weak self] (snapshot) in
            
            if let uploadDataDic = snapshot.value as? [String:Any] {
                print("\(uploadDataDic)")
                self?.fireUploadDic = uploadDataDic
                self?.collectionView!.reloadData()
            }
        })
        // Do any additional setup after loading the view.
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
extension PhotosViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.fireUploadDic == nil {
            return 0
        }
        return (self.fireUploadDic!.count)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",for: indexPath) as! ImageCollectionViewCell
        if let dataDic = fireUploadDic {
            let keyArray = Array(dataDic.keys)
            if let imageUrlString = dataDic[keyArray[indexPath.row]] as? String {
                if let imageUrl = URL(string: imageUrlString) {
                    URLSession.shared.dataTask(with: imageUrl,completionHandler: { (data, response, error) in
                            if error != nil {
                                print("Download Image Task Fail: \(error!.localizedDescription)")
                            }
                            else if let imageData = data {
                                DispatchQueue.main.async {
                                    cell.imageView.image = UIImage(data: imageData)
                                }
                            }
                    }).resume()
                }
            }
        }
        return cell

    }
    
    
    
}
