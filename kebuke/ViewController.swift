//
//  ViewController.swift
//  kebuke
//
//  Created by Rhys.K on 2023/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func updateAfterRequest(data: Data)
    {
        print("UI updated")
    }
    
    func scroll()
    {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        scrollView.backgroundColor = UIColor.lightGray
        view.addSubview(scrollView)
        
        let imageNames = ["item_01", "item_02", "item_03", "item_04"] // 替换为你的图片名称数组

        var contentWidth: CGFloat = 0.0

        for imageName in imageNames {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.frame = CGRect(x: contentWidth, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(imageView)

            contentWidth += imageView.frame.width // 增加 contentWidth，以便下一个图片水平排列
        }

        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
    }
}

