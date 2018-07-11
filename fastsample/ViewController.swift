//
//  ViewController.swift
//  fastsample
//
//  Created by kameover on 2018/07/11.
//  Copyright © 2018年 kameover. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //全てのカメラロールの画像を取得する。(iCloudも含む）
        var assets:PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
        print(assets.debugDescription);
        assets.enumerateObjects({ obj, idx, stop in
            
            if obj is PHAsset
            {
                let asset:PHAsset = obj as PHAsset;
                print("Asset IDX:\(idx)");
                print("mediaType:\(asset.mediaType)");
                print("mediaSubtypes:\(asset.mediaSubtypes)");
                print("pixelWidth:\(asset.pixelWidth)");
                print("pixelHeight:\(asset.pixelHeight)");
                print("creationDate:\(asset.creationDate)");
                print("modificationDate:\(asset.modificationDate)");
                print("duration:\(asset.duration)");
                print("favorite:\(asset.isFavorite)");
                print("hidden:\(asset.isHidden)");
                
                
                let phimgr:PHImageManager = PHImageManager.default();
                phimgr.requestImage(for: asset,
                                    targetSize: CGSize(width: 320, height: 320),
                                    contentMode: .aspectFill, options: nil) {
                                        image, info in
                                        //ここでUIImageを取得します。
                                        //self.photoImageView.image = image
                                        print("UIImage get!");
                }
                
            }
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

