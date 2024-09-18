//
//  ViewController.swift
//  weather broadcast
//
//  Created by user on 18.09.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var WeatherButton: UIButton!

    @IBOutlet weak var WeatherLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        @IBAction func getweatherbutton(_ sender: Any) {
            let URLString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m"
            let url = URL(string: URLString)!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request){ data, respons, error in
                if let data = data, let weather = try? JSONDecoder().decode(Welcome.self, from: data){
                    
                    DispatchQueue.main.async {
                        self.WeatherLabel.text = "\(weather.current.temperature2M) °"
                    }
                }
            }
            task.resume()
        }

}

