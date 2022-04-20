//
//  StateDataViewController.swift
//  Final-Proj
//
//  Created by Jess Ryan on 2/17/22.
//

import UIKit
import Foundation
import ArcGIS

// big shout out to : https://developers.arcgis.com/ios/swift/sample-code/style-wms-layers/
// couldn't have done it without ya

// also all data streaming from WMS service courtsey of the colorado forrest atlas being so kind as to share it with me
// https://co-pub.coloradoforestatlas.org/#/

class StateDataViewController: UIViewController {
    
    @IBOutlet weak var mapView: AGSMapView!
    
    @IBOutlet weak var legendBBI: UIBarButtonItem!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // initialize the map with a light gray basemap
            let map = AGSMap(basemapStyle: .arcGISLightGrayBase)
            
            // assign the map to the map view
            mapView.map = map
            mapView.setViewpoint(AGSViewpoint(latitude: 39, longitude: -98, scale: 3.6978595474472E7))
            
            // a URL to the GetCapabilities endpoint of a WMS service
            let wmsServiceURL = URL(string: "https://geoserver.technosylva.com/geoserver/colorado/wms?service=WMS&version=1.1.0&request=GetCapabilities")!
        
            // the names of the layers to load at the WMS service
            let wmsServiceLayerNames = ["Burn_Probability","Counties"]
                //surfaceFuels is also a really cool layer
            
            // initialize the WMS layer with the service URL and uniquely identifying WMS layer names
            let wmsLayer = AGSWMSLayer(url: wmsServiceURL, layerNames: wmsServiceLayerNames)
            
            // load the WMS layer
            wmsLayer.load { [weak self] (error) in
                if let error = error {
                    print("error:", error)
                } else if wmsLayer.loadStatus == .loaded {
                    // add the WMS layer to the map
                    map.operationalLayers.add(wmsLayer)
                }
            }
            
            
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
