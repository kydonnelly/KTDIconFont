# KTDIconFont

A library for integrating icon fonts into iOS apps

## Getting Started

To see the demo project, clone the repo and run 'pod install' inside KTDIconFont/App. Open the .xcworkspace, select the IconViewer target, and run the app.

## Prerequisites

Cocoapods ≥ 1.3.0
Python ≥ 2.7.10
Xcode ≥ 9.3.1
iOS ≥ 9.0

## Installing

Add the following to your Podfile:

```ruby
platform :ios, '9.0'
source 'https://github.com/kydonnelly/specs.git'
use_modular_headers!
pod 'KTDIconFont', :testspecs => ['Tests']
```

## Use Cases

Icon Fonts are a replacement for png and pdf assets in your app.

The traditional approach of including pngs for each screen resolution (1x, 2x, 3x...) was a clumsy process.

Xcode 6 introduced support for PDF vector images in the asset catalog, which avoids the file sprawl but still generated the assets at build time. This meant the icons still had a specific intended display size, and anything larger would be blurry.

Xcode 9 added the "Preserve Vector Data" option, which solves these problems if you remember to enable it. However, you still need to convert svgs to pdfs then add files individually to the asset catalog.

Icon Fonts are a way to bundle all of your svg icons together into a font file. There is no need to worry about resolutions or managing a file catalog between design/engineering teams. This library provides a script to generate code, so there is a single source of truth defined by the designer. Each icon is represented by an enum case so you can reference it safely. The library contains code to easily display icons in standard UI elements like UIImageView, UIButton, and UIBarItem.

This library is meant to be used for simple icon images that have one color and standard states. It is not meant to be used for complex images like splash screens.

## Implementation

The designer creates svg icons for use in your app. They export them as a font from IcoMoon (https://icomoon.io/)

The developer install KTDIconFont in the project through Cocoapods (See Installing)

Run the script to convert the font file into project code:
```bash 
$ python generate_icon_font.py -s ~/Downloads/MyProjectIconFont.zip -t ~/Projects/MyProject/Source/UI/ -f ~/Projects/MyProject/Fonts
Writing to ~/Projects/MyProject/Source/UI/MyProjectIconFont.swift...
Done!
$
$ python generate_icon_font.py --help

Generate IconFont swift enum from IcoMoon font file.

optional arguments:
  -h, --help            show this help message and exit
  -s SOURCE, --source SOURCE
                        path to the zip or folder downloaded from IcoMoon
  -t TARGET, --target TARGET
                        path to place the generated swift file in
  -f FONT, --font FONT  directory to copy the font file to
```

Add the font to your project's Info.plist "Fonts Provided By Application"

Now you can use KTDIconFont in your project:
```swift
func updateUI(label: UILabel, button: UIButton) {
    label.icon = .menu
    label.iconColor = .purple
    label.disabledIconColor = .gray
    
    button.icon = .checkmark
    button.iconColor = .white
    button.selectedIcon = .checked
    button.selectedIconColor = .green
}
```

## Running unit tests

From the demo project's xcworkspace, go to Manage Schemes and select KTDIconFont-Unit-Tests. Close the Manage Schemes screen, select the unit test target, and Cmd+U to run test cases.

## License

MPL v2, see file.
