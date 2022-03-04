//
//  ViewController.swift
//  KrishnanVenkatesh_searchApp
//
//  Created by student on 3/3/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButtonAction: UIButton!
   
   
    @IBOutlet weak var showNextImagesBtn: UIButton!
    @IBOutlet weak var ShowPrevImagesBtn: UIButton!
    
    @IBOutlet weak var topicInfoText: UITextView!
    @IBOutlet weak var resetBtn: UIButton!
    var array = [["img1","img2","img3","img4","img5"],["img21","img22","img23","img24","img25"],
                 ["img6","img7","img8","img9","img10"]]
        
        var filmmaking = ["actor","hero","film","direction","production","cinematogrphy"]
        
        var music =  ["music","guiter","piano","violin","drums"]
        
        var animal = ["animal","amphibians","mammals","carnivores","Herbivores","animals"]
        
        var topics_array = [["Filmmaking is the process of making a film. Filmmaking involves a number of discrete stages including an initial story, idea, or commission, through scriptwriting, casting, shooting, editing, and screening the finished product before an audience that may result in a film release and exhibition.","A film producer is responsible for finding and launching projects, arranging finance, hiring writers, a director, and a creative team, and supervising all pre-production, production, and post-production events until film release.","A cinematographer, also known as a Director of Photography, is in charge of the camera and the lighting crew. They're the person responsible for creating the look, color, lighting, and for framing of every single shot in a film.","Film directors control and manage a film's creative components and form. Their primary duties include reading and editing scripts, motivating and directing actors and working with editors to produce the film in its final form.","A Film Editor, or Video Editor, is responsible for turning uncut footage from a film shoot into a finished, cohesive final project. Their duties include studying film scripts and using them to guide scene development, determining which camera angles to use and coordinating sound and visual effects in post-production."],["A working definition of music for our purposes might be as follows: music is an intentionally organized art form whose medium is sound and silence, with core elements of pitch (melody and harmony), rhythm (meter, tempo, and articulation), dynamics, and the qualities of timbre and texture.","The piano is a keyboard instrument that produces sound by striking strings with hammers, characterized by its large range and ability to play chords freely. It is a musical instrument that has broad appeal.","a percussion instrument consisting of a hollow shell or cylinder with a drumhead stretched over one or both ends that is beaten with the hands or with some implement (such as a stick or wire brush) 2 : tympanic membrane. 3 : the sound of a drum also : a sound similar to that of a drum.","Singing is the act of producing musical sounds with the voice, and augments regular speech by the use of both tonality and rhythm. One who sings is called a singer or vocalist. Singers perform music that can be sung either with or without accompaniment by musical instruments."],["Animals are multicellular eukaryotes whose cells are bound together by collagen. Animals dominate human conceptions of life on Earth because of their size, diversity, abundance, and mobility. The presence of muscles and mobility is one of the primary characteristics of the animal kingdom.","elephant, (family Elephantidae), largest living land animal, characterized by its long trunk (elongated upper lip and nose), columnar legs, and huge head with temporal glands and wide, flat ears. Elephants are grayish to brown in colour, and their body hair is sparse and coarse. They are found most often in savannas, grasslands, and forests but occupy a wide range of habitats, including deserts, swamps, and highlands in tropical and subtropical regions of Africa and Asia.","A Tiger is a powerful carnivore, a hunter with sharp teeth, strong jaws, and a very agile body. They are the largest naturally occurring species of cat, of which the Siberian tiger is the largest, weighing up to 800 pounds and measuring up to 11 feet head to tail.","monkey, Any member of two tropical anthropoid primate groups: Old World monkeys and New World monkeys. Almost all species are tropical or subtropical, and almost all are diurnal. Most species are arboreal, using all four limbs to leap from tree to tree. They can sit upright and stand erect.","Squirrels are generally small rodents with slender bodies, bushy tails and large eyes. In general, their fur is short, soft and silky, and ranges in thickness from species to species. The color of their fur is also highly variable and can be whitish, gray, yellow, red, brown, or even black."]]
    var imageNumber: Int = 0
       var k = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButtonAction.isEnabled = true
               ShowPrevImagesBtn.isHidden = true
               showNextImagesBtn.isHidden = true
               resetBtn.isHidden = true
               resultImage.image = UIImage(named: "img26")
               topicInfoText.isHidden = false
               topicInfoText.text! = ""
    }

    @IBAction func searchButtonActionClicked(_ sender: UIButton) {
        imageNumber = 0
           let key = searchTextField.text!
               resetBtn.isHidden = false
               ShowPrevImagesBtn.isEnabled = false
               showNextImagesBtn.isEnabled = true
               
             if filmmaking.contains(key)
               {
                 k = 0
                  updateUI(k,imageNumber)
                 
               }
               else if music.contains(key)
               {
                   k = 1
                   updateUI(k,imageNumber)
                   
               }
               else if animal.contains(key)
               {
                   k = 2
                   updateUI(k,imageNumber)
                   
               }
               else
               {
                   resultImage.image = UIImage(named: "notfound")
                   ShowPrevImagesBtn.isHidden = true
                   showNextImagesBtn.isHidden = true
                   topicInfoText.text! = ""
                   searchTextField.text!=""
               }
    }
    
    @IBAction func ShowPrevImagesBtnClicked(_ sender: UIButton) {
        imageNumber -= 1
               updateUI(k,imageNumber)
               ShowPrevImagesBtn.isEnabled = true
                              
               if(imageNumber == array[0].count-1)
               {
               showNextImagesBtn.isEnabled = false
               }
    }

    @IBAction func showNextImagesBtnClicked(_ sender: UIButton) {
        imageNumber += 1
               updateUI(k,imageNumber)
               ShowPrevImagesBtn.isEnabled = true
                              
               if(imageNumber == array[0].count-1)
               {
               showNextImagesBtn.isEnabled = false
               }
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        imageNumber = 0
                searchButtonAction.isHidden = false
                ShowPrevImagesBtn.isHidden = true
                showNextImagesBtn.isHidden = true
                resetBtn.isHidden = true
                resultImage.image = UIImage(named: "info")
                topicInfoText.text!=""
                searchTextField.text!=""
    }
    
    
    @IBAction func searchTextFieldChange(_ sender: Any) {
        
              if !searchTextField.text!.isEmpty
              {
                  searchButtonAction.isHidden = false
              }
              
              else
              {
                  searchButtonAction.isHidden = true
              }
    }
    
       func updateUI(_ imageNum : Int, _ imageNumber : Int){
           ShowPrevImagesBtn.isHidden = false
           showNextImagesBtn.isHidden = false
           resultImage.image = UIImage(named: array[imageNum][imageNumber] )
           topicInfoText.text! = topics_array[imageNum][imageNumber]
              
   }
}
