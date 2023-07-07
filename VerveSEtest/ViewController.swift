//
//  ViewController.swift
//  VerveSEtest
//
//  Created by Kaan Duran on 6.07.2023.
//

import UIKit
import HyBid


extension ViewController : HyBidAdViewDelegate
{
    func adViewDidLoad(_ adView: HyBidAdView!)
    {
        print("Banner Ad View did load:")
    }
    
    func adView(_ adView: HyBidAdView!, didFailWithError error: Error!)
    {
        print("Banner Ad View did fail with error: \(error.localizedDescription)")
    }
    
    func adViewDidTrackClick(_ adView: HyBidAdView!)
    {
        print("Banner Ad View did track click:")
    }
    
    func adViewDidTrackImpression(_ adView: HyBidAdView!)
    {
        print("Banner Ad View did track impression:")
    }
}

extension ViewController : HyBidInterstitialAdDelegate
{
    func interstitialDidLoad()
    {
        print("Interstitial did load:")
        if interstitialAd.isReady {
          interstitialAd.show(from: self)
        }

    }

    func interstitialDidFailWithError(_ error: Error!)
    {
        print("Interstitial did fail with error: \(error.localizedDescription)")
    }
    
    func interstitialDidTrackClick()
    {
        print("Interstitial did track click:")
    }
    
    func interstitialDidTrackImpression()
    {
        print("Interstitial did track impression:")
    }
    
    func interstitialDidDismiss()
    {
        print("Interstitial did dismiss:")
    }
}


class ViewController: UIViewController {
    
    var bannerAdView: HyBidAdView!
    var interstitialAd : HyBidInterstitialAd!

    @IBOutlet weak var laNumberShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bannerAdView = HyBidAdView(size: HyBidAdSize.size_320x50)
        
        self.bannerAdView.frame = CGRect(x: 50, y: 50, width: 320, height: 50)
        view.addSubview(bannerAdView)
        self.bannerAdView.load(withZoneID: "2", andWith: self)
        
        self.interstitialAd = HyBidInterstitialAd(zoneID: "4", andWith: self)

        // Do any additional setup after loading the view, typically from a nib.
    }
    

    var newOperation=true
    func AddNumberToInput(number:String){
      var textNumber = String( laNumberShow.text!)
        if newOperation  {
            textNumber = ""
            newOperation = false
        }
        textNumber = textNumber + number
        laNumberShow.text = textNumber
    }

    @IBAction func buo(_ sender: Any) {
        AddNumberToInput (number: "0")
    }
    
    @IBAction func buDot(_ sender: Any) {
         AddNumberToInput (number: ".")
    }
    @IBAction func bu1(_ sender: Any) {
        AddNumberToInput (number: "1")
    }
    @IBAction func bu2(_ sender: Any) {
        AddNumberToInput (number: "2")
    }
    @IBAction func bu3(_ sender: Any) {
        AddNumberToInput (number: "3")
    }
    @IBAction func bu4(_ sender: Any) {
        AddNumberToInput (number: "4")
    }
    @IBAction func bu5(_ sender: Any) {
        AddNumberToInput (number: "5")
    }
    @IBAction func bu6(_ sender: Any) {
        AddNumberToInput (number: "6")
    }
    @IBAction func bu7(_ sender: Any) {
        AddNumberToInput (number: "7")
    }
    @IBAction func bu8(_ sender: Any) {
        AddNumberToInput (number: "8")
    }
    @IBAction func bu9(_ sender: Any) {
        AddNumberToInput (number: "9")
    }
    
    var op = "+"
    var number1:Double?
    @IBAction func buMul(_ sender: Any) {
        op = "*"
        number1 = Double( laNumberShow.text!)
        newOperation = true
    }
    
    @IBAction func buDiv(_ sender: Any) {
        op = "/"
        number1 = Double( laNumberShow.text!)
        newOperation = true
    }
    
    
    @IBAction func buSub(_ sender: Any) {
        op = "-"
        number1 = Double( laNumberShow.text!)
        newOperation = true
    }
    
    @IBAction func buAdd(_ sender: Any) {
        op = "+"
        number1 = Double( laNumberShow.text!)
        newOperation = true
    }
    
    @IBAction func buAc(_ sender: Any) {
        
        laNumberShow.text = "0"
        newOperation = true
    }
    
    @IBAction func buMinues(_ sender: Any) {
        
        var textNumber = String( laNumberShow.text!)
        textNumber = "-" + textNumber
        laNumberShow.text = textNumber
    }
    
    
    @IBAction func buPercent(_ sender: Any) {
        
             var number1 = Double( laNumberShow.text!)
        
        number1 = number1!/100.0
       laNumberShow.text = String(number1!)
         newOperation = true
    }
    
    
    @IBAction func buEqual(_ sender: Any) {
       let number2 = Double( laNumberShow.text!)
        var results:Double?
        switch op {
        case "*":
            results = number1! * number2!
        case "/":
            results = number1! / number2!
        case "-":
            results = number1! - number2!
        case "+":
            results = number1! + number2!
        default:
            results = 0
        }
       laNumberShow.text = String( results!)
       newOperation = true

     DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
    // Load the interstitial ad when the calculation is complete with 1s delay
        self.interstitialAd.load()
    }
    }
    
}


