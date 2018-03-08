//
//  ViewController.swift
//  FireHello
//
//  Created by Michael on 06/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
//    var ref:DatabaseReference?

    @IBOutlet weak var message: UITextField!
    @IBAction func logout(_ sender: Any) {
        var defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.synchronize()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        var refHandle = ref.observe(DataEventType.value, with: { (snapshot) in
//            let postDict = snapshot.value as? [String : String]
//            self.label.text = postDict?["OnClass"]
//        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var defaults = UserDefaults.standard
        var email = defaults.value(forKey: "email")
        if email == nil {
 //           let loginVC  = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
//            present(loginVC!, animated: true, completion: nil)
            
            performSegue(withIdentifier: "LogoutSegue", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func home(segue:UIStoryboardSegue){
        

    }
    
    @IBAction func sendToFire(_ sender: Any) {
        var ref = Database.database().reference()

        ref.setValue(["OnClass": textField.text])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(" prepare segue", sender)
    }
    @IBAction func addRef(_ sender: Any) {
        
//        ref.child("message")
    }
    @IBAction func uploadImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectedImageFromPicker = pickedImage
        }
        
        let uniqueString = NSUUID().uuidString
        
        if let selectedImage = selectedImageFromPicker {
            
            if let selectedImage = selectedImageFromPicker {
                let storageRef = Storage.storage().reference().child("ImageFireUpload").child("\(uniqueString).png")
                if let uploadData = UIImagePNGRepresentation(selectedImage) {
                    storageRef.putData(uploadData, metadata: nil, completion: { (data, error) in
                        if error != nil {
                            print("Error: \(error!.localizedDescription)")
                            return
                        }
                        if let uploadImageUrl = data?.downloadURL()?.absoluteString {
                            print("Photo Url: \(uploadImageUrl)")
                            let databaseRef = Database.database().reference().child("ImageFireUpload").child(uniqueString)
                            
                            databaseRef.setValue(uploadImageUrl, withCompletionBlock: { (error, dataRef) in
                                if error != nil {
                                    print("Database Error: \(error!.localizedDescription)")
                                }else {
                                    print("圖片已儲存")
                                }
                            })

                        }
                    })
                }
                print("\(uniqueString), \(selectedImage)")
            }
            
            
        }
        
        dismiss(animated: true, completion: nil)

    }
}

