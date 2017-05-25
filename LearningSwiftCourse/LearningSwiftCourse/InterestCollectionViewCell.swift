//
//  InterestCollectionViewCell.swift
//  LearningSwiftCourse
//
//  Created by GEORGE QUENTIN on 25/05/2017.
//  Copyright © 2017 LEXI LABS. All rights reserved.
//

import UIKit

public class InterestCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var interestTitleLabel: UILabel!
    @IBOutlet weak var interestFeaturedImageView: UIImageView!
    
    var interest : Interest! {
        didSet{
            updateUI()
        }
    }
    
    public func updateUI(){
        interestTitleLabel.text = interest.title
        interestFeaturedImageView.image = interest.featuredImage
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) 
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
    }
    
}
