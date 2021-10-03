# SwiftPreview

Preview template for UIkit based project.  
Support custom file template class inherit from UIView and UIViewController.

![](https://i.imgur.com/6Qr7fgp.png)

## How to use?
1. [Download Xcode Template](#Download_Xcode_Template) & [Install SwiftPreview](#Installation)  
2. Xcode > New File (Command + N)  
You can choose Preview or PreviewController.

![](https://i.imgur.com/jHhcl2M.png)
- Preview > (UIView, UITableViewCell, UICollectionViewCell, UICollectionReusableView)  
- PreviewController > (UIViewController, UITableViewController, UICollectionViewController)  

3. Make file then preview will work.

## Download Xcode Template <a id="Download_Xcode_Template"></a>

### Auto Setup 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/heoblitz/SwiftPreview/main/install.sh)"
```

### Manual Setup
```bash
git clone https://github.com/heoblitz/SwiftPreview.git
cd SwiftPreview
mkdir -p ~/Library/Developer/Xcode/Templates/File\ Templates/SwiftPreview
cp -r Templates/. ~/Library/Developer/Xcode/Templates/File\ Templates/SwiftPreview
```

### 

## Installation <a id="Installation"></a>

### Swift Package Manager
Project > Project Dependencies > Add &nbsp; `https://github.com/heoblitz/SwiftPreview`  

### Cocoapods
```ruby
pod 'SwiftPreview'
```


## UnInstallation
1. Remove dependency
2. Delete template files
```bash
rm -r ~/Library/Developer/Xcode/Templates/File\ Templates/SwiftPreview
```

## License
MIT
