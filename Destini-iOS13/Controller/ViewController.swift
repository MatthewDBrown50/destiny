//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!

    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        updateUI(0)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let choice1 = storyBrain.getStories()[storyBrain.getStoryNumber()].getChoice1()
        
        if sender.titleLabel?.text == choice1 {
            updateUI(1)
        } else {
            updateUI(2)
        }
    }
    
    func updateUI(_ choice: Int) {
        
        if choice == 1 || choice == 2{
            storyBrain.nextStory(choice)
        }
        
        let storyNumber = storyBrain.getStoryNumber()
        let stories = storyBrain.getStories()
        
        textLabel.text = stories[storyNumber].getTitle()
        topButton.setTitle(stories[storyNumber].getChoice1(), for: .normal)
        bottomButton.setTitle(stories[storyNumber].getChoice2(), for: .normal)
    }
}

