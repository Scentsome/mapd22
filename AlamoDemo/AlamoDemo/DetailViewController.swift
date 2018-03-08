//
//  DetailViewController.swift
//  AlamoDemo
//
//  Created by Michael on 08/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var info:Information?
    override func viewDidLoad() {
        super.viewDidLoad()

        print(info?.Add)
        var address:String = (info?.Add)!
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            let mkplacemark = MKPlacemark(placemark:placemarks![0])
            print(mkplacemark)
            moveToPlace(mkplace: mkplacemark)
            
        }
        func moveToPlace(mkplace:MKPlacemark) {
            
            
            
            
            let center:CLLocationCoordinate2D = mkplace.coordinate
            let mySpan = MKCoordinateSpanMake(0.05, 0.05)
            
            let toRegion = MKCoordinateRegionMake(center, mySpan)
            mapView.setRegion(toRegion, animated:true)
            
            var pointAnnotation = MKPointAnnotation()
            
            pointAnnotation.coordinate = mkplace.coordinate
            
            self.mapView.addAnnotation(pointAnnotation)
        }
    

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
