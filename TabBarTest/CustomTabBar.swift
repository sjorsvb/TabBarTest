//
//  CustomTabBar.swift
//  TabBarTest
//
//  Created by Sjors van Berkel on 20-10-17.
//  Copyright © 2017 Sjors van Berkel. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {

    private let height: CGFloat = 150
    private var stripeLeadingAnchor: NSLayoutConstraint!
    private var stripeWidthAnchor: NSLayoutConstraint!
    private var stripeView: UIView!
    private let stripeHeight: CGFloat = 5

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topView)
        NSLayoutConstraint.activate([
        topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        topView.topAnchor.constraint(equalTo: self.topAnchor)])
        topView.heightAnchor.constraint(equalToConstant: stripeHeight).isActive = true

        stripeView = UIView()
        stripeView.translatesAutoresizingMaskIntoConstraints = false
        stripeView.backgroundColor = .blue
        topView.addSubview(stripeView)

        stripeLeadingAnchor = stripeView.leadingAnchor.constraint(equalTo: topView.leadingAnchor)
        stripeWidthAnchor = stripeView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1/2)

        NSLayoutConstraint.activate([
        stripeView.topAnchor.constraint(equalTo: topView.topAnchor),
        stripeView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
        stripeLeadingAnchor,
        stripeWidthAnchor
        ])
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: height)
    }

    override func setItems(_ items: [UITabBarItem]?, animated: Bool) {

        items?.forEach{
            item in
            item.imageInsets = UIEdgeInsets.init(top: stripeHeight, left: 0, bottom: -1 * stripeHeight, right: 0)
        }

        super.setItems(items, animated: animated)
        
    }

    func doMagic(item: UITabBarItem) {
        UIView.animate(withDuration: 0.2) {
            self.stripeLeadingAnchor.constant = self.stripeView.bounds.width * CGFloat( (self.items?.index(of: item))!)

            self.layoutIfNeeded()
        }
    }
}
