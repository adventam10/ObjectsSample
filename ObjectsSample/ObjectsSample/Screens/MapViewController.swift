//
//  MapViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView! {
        didSet {
            // 兵庫県明石市あたりを初期表示
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            mapView.region = MKCoordinateRegion(center: .init(latitude: 34.39, longitude: 135), span: span)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
