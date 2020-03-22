//
//  UIImage+IconFont.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import Foundation

// MARK: Standard Icons
extension UIImage {
    
    public static func image<T: IconFont>(icon: T, color: UIColor, backgroundColor: UIColor, size: CGSize, inset: CGFloat, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) -> UIImage? {
        // UIGraphics will not return an image for zero size
        guard size != .zero else {
            return nil
        }
        
        // Setup icon text
        guard let textContent = T.iconCode(for: icon) else {
            return nil
        }
        
        // Setup text attributes
        let fontSize = min(size.width, size.height) - 2 * inset
        let font = T.font(size: fontSize)
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.foregroundColor: color,
                          NSAttributedString.Key.backgroundColor: UIColor.clear,
                          NSAttributedString.Key.paragraphStyle: style]
        
        // Setup drawing layout
        let textRect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        // Draw background rectangle
        let path = UIBezierPath.init(roundedRect: textRect, cornerRadius: cornerRadius)
        backgroundColor.setFill()
        path.fill()
        
        // Draw icon text
        let rectOffset = (size.width - size.height) * 0.5
        let textPoint = CGPoint(x: inset + max(0, rectOffset), y: inset - min(0, rectOffset))
        textContent.draw(at: textPoint, withAttributes: attributes)
        
        // Draw border
        let borderPath = UIBezierPath(ovalIn: textRect.insetBy(dx: borderWidth, dy: borderWidth))
        borderColor.setStroke()
        borderPath.lineWidth = borderWidth
        borderPath.stroke()
        
        // Return final image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}

// MARK: Cutout Icons
extension UIImage {
    
    public static func cutoutImage<T: IconFont>(icon: T, backgroundColor: UIColor, size: CGSize, inset: CGFloat, cornerRadius: CGFloat) -> UIImage? {
        // Get icon image
        guard let cutoutIcon = UIImage.image(icon: icon, color: .white, backgroundColor: .clear, size: size, inset: inset, cornerRadius: cornerRadius, borderWidth: 0, borderColor: .clear) else {
            return nil
        }
        
        // Setup image mask
        guard let cutoutImage = cutoutIcon.cgImage, let dataProvider = cutoutImage.dataProvider else {
            return nil
        }
        guard let mask = CGImage(maskWidth: cutoutImage.width, height: cutoutImage.height, bitsPerComponent: cutoutImage.bitsPerComponent, bitsPerPixel: cutoutImage.bitsPerPixel, bytesPerRow: cutoutImage.bytesPerRow, provider: dataProvider, decode: nil, shouldInterpolate: false) else {
            return nil
        }
        
        // Setup drawing layout
        let iconBounds = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // Clip image mask from context
        context?.translateBy(x: 0, y: iconBounds.size.height)
        context?.scaleBy(x: 1, y: -1)
        context?.clip(to: iconBounds, mask: mask)
        
        // Draw background around cutout
        let path = UIBezierPath.init(roundedRect: iconBounds, cornerRadius: cornerRadius)
        backgroundColor.setFill()
        path.fill()
        
        // Return final image
        let clippedIcon = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return clippedIcon
    }
    
}
