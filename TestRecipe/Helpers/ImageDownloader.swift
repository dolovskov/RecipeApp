//
//  ImageDownloader.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation
import Alamofire


    
func getImage(byUrl url:String, _ onCompletion: @escaping (UIImage) -> Void) {
    
    let destination: DownloadRequest.DownloadFileDestination = { _, _ in
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.applicationSupportDirectory,
                                                       FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentDirectoryPath: String = path[0]
        let destinationURLForFile = URL(fileURLWithPath: documentDirectoryPath)
        return (destinationURLForFile, [.removePreviousFile, .createIntermediateDirectories])
    }
    
    Alamofire.SessionManager.default.download(url, method: .get, to: destination).response { response in
        if response.response?.statusCode == 200 {
            if  let imagePath = response.destinationURL?.path {
                
                guard let image = UIImage(contentsOfFile: imagePath) else { return }
                onCompletion(image)
            }
        }
    }

}
