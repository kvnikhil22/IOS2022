//
//  ViewController.swift
//  KrishnanVenkatesh
//
//  Created by Krishnan Venkatesh,Nikhil on 3/31/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordsguessedlabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var totalWordsLabel: UILabel!
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessLetterField: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    var words = [["CAMERA", "A device that consists of lightproof camber with an aperture fitted with a lens & shutter through which the image captured"],
                 ["CINEMA","the art and technology of motion-picture photography."],
                 ["FILMMAKER", "A career that individual creatively direct,leading and developing movie productions."],
                 ["DIRECTOR", "Who control and manage a film's creative components and form."],
                 ["EDITOR","Software used in post production of video."]]

    var images =  ["CAMERA","CINEMATOGRAPHY","FILMMAKER","DIRECTOR","PREMIERPRO","NGU"]

    var guessesRemaining = 11
    var wordHint = ""
    var guessWord = ""
    let maxNumOfWrongGuesses = 10
    var wordsGuessed = 0
    var guessCount = 0
    var wordsMissed = 0
    var indexOfWord = 0
    var guessedLetters = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        wordHint = words[indexOfWord][1]
        guessWord = words[indexOfWord][0]
        totalWordsLabel.text = "Total number of words in game: \(words.count)"
        wordsRemainingLabel.text = "Total number of words remaining in game: \(words.count)"
        formatWordField()
        hintLabel.text = "HINT: " + wordHint
        playAgainButton.isHidden = true
        guessButton.isEnabled = false
    }
    func updateCount(){
        wordsMissedLabel.text = "Total number of words guessed wrongly: \(wordsMissed)"
        wordsguessedlabel.text = "Total number of words guessed successfully: \(wordsGuessed)"
        wordsRemainingLabel.text = "Total number of words remaining in game: \(words.count - (wordsGuessed + wordsMissed))"
    }
    func updateInterfaceAfterGuess(){
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    func formatWordField() {
        var revealedWord = ""
        guessedLetters += guessLetterField.text!
        
        for letter in guessWord {
            if guessedLetters.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    func letterGuessed() {
        formatWordField()
        guessCount += 1
        guessesRemaining = guessesRemaining - 1
        let currentLetterGuessed = guessLetterField.text!
        let revWord = userGuessLabel.text!
        if guessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessButton.isEnabled = false
            guessCountLabel.text = "You have used all the available guesses, Please start again"
            wordsMissed += 1
            updateCount()
            updateImages()
        } else if !revWord.contains("_") {
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessButton.isEnabled = false
            guessCountLabel.text = "You won! It took you \(guessCount) attempts to guess the word!"
            wordsGuessed += 1
            updateCount()
            updateImages()
        } else {
            let guess = ( guessCount == 1 ? "Guess" : "Guesses")
            guessCountLabel.text = "You have made \(guessCount) \(guess)"
        }
        if (wordsGuessed + wordsMissed) == words.count {
            guessCountLabel.text = "Congratulations, You are done, Please start over again ?"
            updateImages()
        }
    }
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessLetterField.text?.last {
            guessLetterField.text = "\(letterGuessed)"
            guessButton.isEnabled = true
        } else {
            
            guessButton.isEnabled = false
        }
    }
    @IBAction func guessKeyPressed(_ sender: UITextField) {
        letterGuessed()
        updateInterfaceAfterGuess()
        let letter = guessLetterField.text
        if letter?.isEmpty == true{
            guessButton.isEnabled = false
        }
        else{
            guessButton.isEnabled = true
        }
    }
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        letterGuessed()
        updateInterfaceAfterGuess()
        let letter = guessLetterField.text
        if letter?.isEmpty == true{
            guessButton.isEnabled = false
        }
        else{
            
            guessButton.isEnabled = true
        }
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        imageView.isHidden = true
        indexOfWord += 1
        if indexOfWord == words.count {
            indexOfWord = 0
            wordsGuessed = 0
            wordsMissed = 0
            updateCount()
        }
        guessWord = words[indexOfWord][0]
        wordHint = words[indexOfWord][1]
        hintLabel.text = "HINT: " + wordHint
        playAgainButton.isHidden = true
        guessLetterField.isEnabled = true
        guessButton.isEnabled = false
        guessesRemaining = maxNumOfWrongGuesses + 1
        guessedLetters = ""
        formatWordField()
        guessCountLabel.text = "You have Made Zero Guessess"
        guessCount = 0
    }
    func updateImages(){
        if(guessesRemaining == 0){
            imageView.isHidden = false
            imageView.image = UIImage(named: images[5])
            let originalImageFrame = imageView.frame
            let widthShrink: CGFloat = 10
            let heightShrink: CGFloat = 10
            let newFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - widthShrink,
            height: imageView.frame.height - heightShrink)
            imageView.frame = newFrame
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0,  animations: {
                            self.imageView.frame = originalImageFrame
                        })
                    }
        else
        {
            imageView.isHidden = false
            imageView.image = UIImage(named: images[indexOfWord])
            let originalImageFrame = imageView.frame
            let widthShrink: CGFloat = 10
            let heightShrink: CGFloat = 10
            let newFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - widthShrink,
            height: imageView.frame.height - heightShrink)
            imageView.frame = newFrame
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0,  animations: {
                            self.imageView.frame = originalImageFrame
                        })
                 }
           }

      }

