//
//  UIImageView+Extension.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {

    public func imageFromUrl(_ urlString: String?, defaultImgPath : String?) {

        let tmpUrl : String?

        if urlString == nil {
            tmpUrl = ""
        } else  {
            tmpUrl = urlString
        }
        if let url = tmpUrl, let defaultURL : String = defaultImgPath {
            if url.isEmpty {
                self.kf.setImage(with: URL(string: defaultURL), options: [.transition(ImageTransition.fade(0.5))])
            } else {
                self.kf.setImage(with: URL(string: url), options: [.transition(ImageTransition.fade(0.5))])
            }
        }

    }
    
    func setImageBangMoon(_ urlString: String?){
        if urlString == "" || urlString == nil {
            setImage(with: APIConstants.BaseURL + "/")
        } else {
            setImage(with: (urlString ?? ""))
        }
    }
    
    func setImageContentMode(_ urlString: String?, imgvw: ImageView){
        if urlString == "" || urlString == nil {
            imgvw.contentMode = .scaleAspectFit
        } else {
            imgvw.contentMode = .scaleAspectFill
        }
    }

    func setImage(with urlString: String) {
        let cache = ImageCache.default
        cache.retrieveImage(forKey: urlString, options: nil) { (image, _) in // 캐시에서 키를 통해 이미지를 가져온다.
            if let image = image { // 만약 캐시에 이미지가 존재한다면
                self.image = image // 바로 이미지를 셋한다.
            } else {
                let url = URL(string: urlString) // 캐시가 없다면
                let resource = ImageResource(downloadURL: url! , cacheKey: urlString) // URL로부터 이미지를 다운받고 String 타입의 URL을 캐시키로 지정하고
                self.kf.setImage(with: resource) // 이미지를 셋한다.
            }
        }
    }


    
}
