//
//  IconSwiftUICell.swift
//  IconViewer
//
//  Created by Kyle Donnelly on 12/17/21.
//  Copyright © 2021 Kyle Donnelly. All rights reserved.
//

import SwiftUI

class IconHostingCell: UITableViewCell {
    
    private let hostingController = UIHostingController<IconSwiftUICell?>(rootView: nil)
    
    public func setup(icon: KTDIcons, parentController: UIViewController) {
        let contentView = IconSwiftUICell(icon: icon, iconName: "\(icon)")
        
        self.hostingController.willMove(toParent: nil)
        self.hostingController.view.removeFromSuperview()
        self.hostingController.removeFromParent()
        self.hostingController.didMove(toParent: nil)
        
        self.hostingController.rootView = contentView
        self.hostingController.view.invalidateIntrinsicContentSize()
        self.hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.hostingController.view.backgroundColor = .clear
        self.hostingController.view.frame = self.contentView.bounds
        
        self.hostingController.willMove(toParent: parentController)
        parentController.addChild(self.hostingController)
        self.contentView.addSubview(self.hostingController.view)
        self.hostingController.didMove(toParent: parentController)
    }
    
}

struct IconSwiftUICell: View {
    var icon: KTDIcons
    var iconName: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(icon: self.icon, iconSize: 44)
            Text(iconName)
            Spacer()
            Button(action: { }, icon: self.icon).foregroundColor(.purple)
        }.padding()
    }
}

struct IconSwiftUICell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(KTDIcons.allCases, id: \.rawValue) {
                IconSwiftUICell(icon: $0, iconName: "test")
            }
        }
    }
}
