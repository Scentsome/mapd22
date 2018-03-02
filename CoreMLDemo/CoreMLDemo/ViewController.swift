//
//  ViewController.swift
//  CoreMLDemo
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let model = Inceptionv3()
    
    @IBAction func predict(_ sender: Any) {
        
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 299, height: 299)
            , true, 2.0)
        
        imageView.image?.draw(in: CGRect(x: 0, y:0, width: 299, height: 299))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        let attrs:NSDictionary = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                                  kCVPixelBufferCGBitmapContextCompatibilityKey:kCFBooleanTrue]
        
        var pixelBuffer:CVPixelBuffer? = nil
        
        let status:CVReturn =  CVPixelBufferCreate(kCFAllocatorDefault,
                                                   Int(newImage.size.width),
                                                   Int(newImage.size.height),
                                                   kCVPixelFormatType_32BGRA,
                                                   attrs,
                                                   &pixelBuffer)
        
        if (status !=  kCVReturnSuccess ){
            print("=== error status ",status)
            return
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, .readOnly)
        
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        
        let context:CGContext = CGContext(data: pixelData,
                                          width: Int(newImage.size.width),
                                          height: Int(newImage.size.height),
                                          bitsPerComponent: 8,
                                          bytesPerRow:CVPixelBufferGetBytesPerRow(pixelBuffer!),
                                          space: rgbColorSpace,
                                          bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)!
        
        context.translateBy(x: 0,y: newImage.size.height)
        context.scaleBy(x: 1.0, y:-1.0)
        UIGraphicsPushContext(context)
        newImage.draw(in: CGRect(x: 0, y: 0,
                                 width: newImage.size.width,  height: newImage.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!,
                                       CVPixelBufferLockFlags(
                                        rawValue: CVPixelBufferLockFlags.RawValue(
                                            CGImageAlphaInfo.noneSkipFirst.rawValue)))
        imageView.image = newImage
        
        do {
            let result:Inceptionv3Output = try model.prediction(image: pixelBuffer!)
            descriptionLabel.text = result.classLabel
            print("========== ", result.classLabel)
        }
        catch {
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

