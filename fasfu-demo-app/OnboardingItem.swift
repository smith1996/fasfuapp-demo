//
//  OnboardingItem.swift
//  fasfu-demo-app
//
//  Created by Smith on 4/11/21.
//

import Foundation
import UIKit

@IBDesignable
class OnboardingItem: UIView {
    
    static let ONBOARDING_ITEM_NIB = "OnboardingItem"
    
    @IBOutlet weak var backgrounImageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var grayTitleLabel: UILabel!
    @IBOutlet weak var blueTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
//    private var mainView: UIView {
//        guard let view = loadViewFromNib() else { fatalError("Could not load view from nib file.") }
//        view.frame = bounds
//        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        return view
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initWithNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initWithNib()
    }
    
    convenience init(text: String? = "") {
        self.init()
        descriptionLabel.text = text
    }
    
    func initWithNib() {
        guard let view = loadViewFromNib() else { fatalError("Could not load view from nib file.") }
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
//        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: OnboardingItem.ONBOARDING_ITEM_NIB, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override func draw(_ rect: CGRect) {
        
        let y:CGFloat = 60
        let curveTo:CGFloat = 0
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: contentView.bounds.width, y: y + 30.0), controlPoint: CGPoint(x: contentView.bounds.width / 2 - 20.0, y: curveTo))
        myBezier.addLine(to: CGPoint(x: contentView.bounds.width, y: contentView.bounds.height))
        myBezier.addLine(to: CGPoint(x: 0, y: contentView.bounds.height))
        myBezier.close()
        
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        backgroundColor?.setFill()
        myBezier.fill()
        
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = myBezier.cgPath
        self.contentView.layer.mask = maskLayer
    }
    
}
