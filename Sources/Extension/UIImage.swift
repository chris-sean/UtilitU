//
//  UIImage+F.swift
//  
//
//  Created by Felix on 2018/6/7.
//

import UIKit

public extension UIImage {

    func resize(toAspect fitSize: CGSize) -> UIImage? {
        var reSize = fitSize
        if (fitSize.width / fitSize.height > self.size.width / self.size.height) {
            reSize.width = self.size.width * fitSize.height / self.size.height
        } else {
            reSize.height = self.size.height * fitSize.width / self.size.width
        }
        return self.resize(to: reSize)
    }
    
    func scaled(scale: CGFloat) -> UIImage? {
        let size = CGSize(width: self.size.width * scale, height: self.size.height * scale)
        return self.resize(to: size)
    }
    
    func resize(to size: CGSize) -> UIImage? {
        if (self.size.width < size.width + 0.5 && self.size.width > size.width - 0.5 && self.size.height < size.height + 0.5 && self.size.height > size.height - 0.5) {
            return self;
        }
        let render = UIGraphicsImageRenderer(size: size)
        let resizedImage = render.image { (context) in
            self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        return resizedImage
//        UIGraphicsBeginImageContext(CGSize(width: size.width, height: size.height))
//        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//        let reSizeImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return reSizeImage
    }

    func compressedJPEGDataFor(limitedSize: Int) -> Data? {
        var quality: CGFloat = 1
        let guessMaxSize = self.size.width * self.size.height * 0.5
        let maxSize = CGFloat(limitedSize)
        if guessMaxSize > maxSize {
            quality = maxSize / guessMaxSize
            if (quality < 0.5) {
                quality = 0.5
            }
        }
        var imageData = self.jpegData(compressionQuality: quality)
        if imageData == nil {
            return nil
        }
        let minSize = maxSize * 0.1
        var lastDataLength = imageData!.count
        logDebug("compressed image size:\(imageData!.count)")
        while imageData!.count >= limitedSize {
            quality *= 0.5;
            imageData = self.jpegData(compressionQuality: quality);
            if imageData == nil {
                return nil
            }
            logDebug("compressed image size:\(imageData!.count)")
            if CGFloat(lastDataLength - imageData!.count) < minSize { // 可以压缩的空间有限甚至没有压缩空间了
                break;
            }
            lastDataLength = imageData!.count;
        }
        return imageData;
    }

}
