//
//  CompleteQuestionPromptViewController.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class CompleteQuestionPromptViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var distressLevelLabel: UILabel!
    @IBOutlet weak var stepView: UIView!
    @IBOutlet weak var distressLevelView: UIView!
    @IBOutlet weak var thoughtsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCompletePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    class CustomUISlider : UISlider
    {
        override func trackRectForBounds(bounds: CGRect) -> CGRect {
            //keeps original origin and width, changes height, you get the idea
            let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 60.0))
            super.trackRectForBounds(customBounds)
            return customBounds
        }
        
     
        //while we are here, why not change the image here as well? (bonus material)
        override func awakeFromNib() {
            self.setThumbImage(UIImage(named: "customThumb"), forState: .Normal)
            super.awakeFromNib()
        }
    }
 

    @IBAction func onSliderChange(sender: UISlider) {
        if slider.value > 50 {
            slider.minimumTrackTintColor = UIColor.blackColor()
            distressLevelLabel.text = "Different text"
        } else if slider.value > 25 && slider.value < 50 {
            slider.minimumTrackTintColor = UIColor.blueColor()
            distressLevelLabel.text = "middle text"

        } else {
            slider.minimumTrackTintColor = UIColor.redColor()
            distressLevelLabel.text = "lowest text"

        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
