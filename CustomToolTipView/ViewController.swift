//
//  ViewController.swift
//  CustomToolTipView
//
//  Created by ZEUS on 18/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    
    private let tooltipManager: TooltipManager = TooltipManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.setupTooltip()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupTooltip(forcing: Bool = false){
        guard !tooltipManager.didSetupTooltips || forcing else {
            return
        }
        
        let tooltips: [ViewControllerTooltip] = [.title(in: lbl1),
                                                 .image(in: img1),
                                                 .button(in: btn4)]
        
        tooltipManager.delegate = self
        tooltipManager.setup(tooltips: tooltips, darkView: view)
    }


    @IBAction func btnAction(_ sender: UIButton) {
        setupTooltip(forcing: true)
    }
}


extension ViewController: ToolTipDelegate{
    func toolTipDidComplete() {
        
    }
}
