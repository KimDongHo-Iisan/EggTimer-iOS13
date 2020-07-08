//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    let eggTimes = ["Soft": 5, "Medium":7, "Hard":12]
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle! //Soft,Medium,Hard
        
        print(eggTimes[hardness]!) //optioanl타입이라고 경고가 뜬다 이유는 제목이 없는 IBAction을 트리거 하는 버튼이 있을수 있기때문이다. 그 경우에는 currnetTitle이 nil이 된다. 사전에 있는 키값들은 선택적 문자열이 아닌 확실한 문자열이기때문에, 선택적 문자열은 사용할수 없다. 그렇기 때문에 currentTitle값이 선택적 문자열이 안오게 변환해줘야한다
        
        // 하지만 이 상태에서 앱을 실행하면 오류는 뜨지 않지만, 앱이 멈춰버린다. 이유는 버튼을 클릭하면 옵셔널이 뜨는것을 알수 있다. 이 옵셔널 같은 경우에는 currnetTitle때문에 일어나는것이 아니다.
        
        // 사전의 원리 때문에 이러한 것인데, 사전에 있는 키값들은 선택적 문자열이 아닌 확실한 문자열이다. 즉 대문자, 소문자 등의 오타가 발생하지 않아야 그 키에 값이 할당되는 것이다. 그런데 컴퓨터는 그 키가 오타가 있을지 없을지를 확신하지 못하기 때문에, 옵셔널을 할당해버린다. 그렇기 때문에 우리가 컴퓨터에게 확신을 주는 언래핑을 해줘야한다.
        
        /* 1. if문으로 작성
         if hardness == "Soft" {
         print(softTime)
         } else if hardness == "Medium"{
         print(mediumTime)
         } else {
         print(hardTime)
         }
         */
        
        /* 2. switch문으로 작성.
         switch hardness {
         case "Soft":
         print(softTime)
         case "Medium":
         print(mediumTime)
         case "Hard":
         print(hardness)
         default:
         print("Error")
         }
         */
        
    }
    
}





#2



//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420 ,"Hard": 720]
    
    var secondRemaining = 60
    
    //
    var timer = Timer() // 변수 timer를 할당
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() // 버튼을 누를때마다 타이머가 초기화 되고, 새로운 타이머를 호출하도록 만들어주는 코드.
        let hardness = sender.currentTitle!
        
        secondRemaining = eggTimes[hardness]!
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true) //repeats 타이머를 반복할것인지 여부 #selector는 오브젝트c시절에 사용하던것인데, 함수를 부를때 사용하는 코드이다.
        
        print(eggTimes[hardness]!)
         
        
    }
    /*
    @objc func updateTimer(){
        if secondRemaining > 0{
            print("\(secondRemaining) seconds.")
            secondRemaining -= 1
        }
        
         이 코드 그대로 사용하게 되면, soft를 눌렀다가 다른 버튼을 눌렀을 경우에 타이머가 2초 더 빨라지는 오류가 발생하게 된다. 이유는 버튼을 누를때마다 타이머를 호출하고 있기때문에, 타이머가 중간에 사라지는게 아닌, 다른 타이머가 바로 호출되는것이기 때문이다. 때문에 반복되는 호출을 막기위해,
 */
    
    @objc func updateTimer(){
           if secondRemaining > 0{
               print("\(secondRemaining) seconds.")
               secondRemaining -= 1
           } else { // 시간이 종료된 이후
            timer.invalidate() //타이머를 한번 더 종료시키고.
            titleLabel.text = "Done!" //레이블의 문장을 done으로 변경한다.
        }
    
    }
    
}


#3


//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420 ,"Hard": 720]
    
    var secondRemaining = 60
    
    //
    var timer = Timer() // 변수 timer를 할당
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 1.0 // progressBar를 100프로로 설정하는 방법.
        
        timer.invalidate() // 버튼을 누를때마다 타이머가 초기화 되고, 새로운 타이머를 호출하도록 만들어주는 코드.
        let hardness = sender.currentTitle!
        
        secondRemaining = eggTimes[hardness]!
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true) //repeats 타이머를 반복할것인지 여부 #selector는 오브젝트c시절에 사용하던것인데, 함수를 부를때 사용하는 코드이다.
        
        print(eggTimes[hardness]!)
         
        
    }
    /*
    @objc func updateTimer(){
        if secondRemaining > 0{
            print("\(secondRemaining) seconds.")
            secondRemaining -= 1
        }
        
         이 코드 그대로 사용하게 되면, soft를 눌렀다가 다른 버튼을 눌렀을 경우에 타이머가 2초 더 빨라지는 오류가 발생하게 된다. 이유는 버튼을 누를때마다 타이머를 호출하고 있기때문에, 타이머가 중간에 사라지는게 아닌, 다른 타이머가 바로 호출되는것이기 때문이다. 때문에 반복되는 호출을 막기위해,
 */
    
    @objc func updateTimer(){
           if secondRemaining > 0{
               print("\(secondRemaining) seconds.")
               secondRemaining -= 1
           } else { // 시간이 종료된 이후
            timer.invalidate() //타이머를 한번 더 종료시키고.
            titleLabel.text = "Done!" //레이블의 문장을 done으로 변경한다.
        }
    
    }
    
}





























#4



//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4 ,"Hard": 5]
    var timer = Timer()
    var totalTime = 0 //총 시간
    var secondPassed = 0 // secondRemaining과 다르게 이것은 0부터 올라간다.
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        print(eggTimes[hardness]!)
         
        
    }
    
    
    @objc func updateTimer(){
           if secondPassed < totalTime {
            
            let percentageProgress = secondPassed / totalTime
            
//            progressBar.progress = percentageProgress  이렇게만 쓰면 precentageProgress는 정수값이기때문에 float를 사용해야하는 progress식에 어울리지 않는다 이때문에 형변환을 해야한다
            
             progressBar.progress = Float(percentageProgress)
            /*이렇게 형변환을 하면 에러는 나지않지만, 진행바가 0에서 움직이지 않는다 print문을 이용해서 확인해보면 계속해서 0.0이 나타나게 된다 이유는 예를 들어서
             let a = 5
             let b = 2
             
             print(Float(a/b))를 한다면, 2.5가 나올것이라고 예상을 하지만, 사실 2.0이 나온다 이유는 계산할때 a/b를 먼저 계산하게 되는데 정수/정수를 할 경우에는 소숫점을 가질수 없기때문에 소숫점을 버리고 정수만 출력하게 된다. 즉 2.5가 아닌 2를 가져오기때문에, 그 숫자 2에 float로 둘러 쌓아봣자 2.0이 출력되는 것이다. 그렇기 때문에 계산하기 전에 정수를 float로 형변환을 한다음에 계산을 해야 소숫점을 가진 데이터타입을 얻을수 있다.
             
            print(Float(a) / Float(b))를 해야 2.5가 나오게 된다.
             
             다른 방법으로는 let a: Float = 5 시작부터 float라고 정의를 내려주면된다.
                         let b: Float = 2
             print(a/b)
            
 */
               secondPassed += 1
           } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    
    }
    
}
