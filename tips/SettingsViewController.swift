//
//  SettingsViewController.swift
//  tips
//
//  Created by Victor Li Wang on 12/18/15.
//  Copyright © 2015 victorliwang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        settingsTipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        settingsTipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        [defaults .setInteger(settingsTipControl.selectedSegmentIndex, forKey: "default_tip_percentage")]
        defaults.synchronize()
        
        print("default index changed to %d", defaults.integerForKey("default_tip_percentage") )
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
