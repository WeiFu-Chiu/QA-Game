//
//  ContentViewController.swift
//  MarryMe
//
//  Created by LC105-21417-02 on 2023/4/11.
//

import Foundation
import UIKit

class ContentViewController: BaseViewController {
    @IBOutlet weak var imageSliderCollectionView: UICollectionView!
    @IBOutlet weak var sliferPageControl: UIPageControl!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var noLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var enterStackView: UIStackView!
    @IBOutlet weak var enterTextField: CustomTextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var questionCount: Int = 0
    var questionList: [String] = [
        "準備好開始遊玩了嗎？",
        "真的決定開始了嗎？",
        "妳相信愛情嗎？",
        "妳愛的人叫什麼名字？",
        "交往紀念日是幾年幾月幾號(YYYY/MM/DD)？",
        "請輸入卡片中的數字？",
        "看完卡片了嗎？",
        "確定看完卡片了嗎？",
        "親愛的寶貝願意嫁給我嗎？"
    ]
    
    var answerList: [Any] = [
        true,
        true,
        true,
        "邱緯輔",
        "2017/09/01",
        "5201314",
        true,
        true,
        true
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterTextField.delegate = self
        questionLabel.text = questionList[questionCount]
        
        enterStackView.isHidden = true
        errorLabel.isHidden = true
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        guard questionCount < questionList.count - 1 else {
            correctAnswer {
                self.addAlertController("恭喜你將成為人妻", "請在卡片簽下你的名字，我們將邁入下個程序")
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                    self.dismiss(animated: true)
                    
                    let blurEffect = UIBlurEffect(style: .light)
                    let blurView = UIVisualEffectView(effect: blurEffect)
                    blurView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
                    self.view.addSubview(blurView)
                    
                    self.addAnimationView(jsonName: "dimond-ring", specificView: blurView.contentView, speed: 1, loopMode: .repeat(5), orignPosition: (x: 0, y: 0), frameTime: (from: 0, to: 300), completion: { finshed, animateView in
                        blurView.removeFromSuperview()
                    })
                })
            }
            return
        }
        
        switch self.questionCount {
        case 3:
            if let answer = (self.answerList[self.questionCount] as? String), answer == enterTextField.text {
                correctAnswer {
                    self.confirmButton.isEnabled = false
                    self.addAlertController("即將進入下一關", "請稍候一下")
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                        self.questionCount += 1
                        self.questionLabel.text = self.questionList[self.questionCount]
                        self.enterTextField.text = ""
                        self.confirmButton.isEnabled = true
                        self.dismiss(animated: true)
                    })
                }
            } else {
                failureAnswer {
                    self.addAlertController("你要想清楚誒", "你家親愛的是誰")
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                        self.dismiss(animated: true)
                    })
                }
            }
            break
        case 4:
            if let answer = (self.answerList[self.questionCount] as? String), answer == enterTextField.text {
                correctAnswer {
                    self.confirmButton.isEnabled = false
                    self.addAlertController("即將進入下一關", "請稍候一下")
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                        self.questionCount += 1
                        self.questionLabel.text = self.questionList[self.questionCount]
                        self.enterTextField.text = ""
                        self.confirmButton.isEnabled = true
                        self.dismiss(animated: true)
                        
                        let blurEffect = UIBlurEffect(style: .light)
                        let blurView = UIVisualEffectView(effect: blurEffect)
                        blurView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
                        self.view.addSubview(blurView)
                        self.addAnimationView(jsonName: "contact-mail", specificView: blurView.contentView, speed: 1, loopMode: .playOnce, orignPosition: (x: 0, y: 0), frameTime: (from: 0, to: 300), completion: { finshed, animateView in
                            blurView.removeFromSuperview()
                            self.addAlertController("關卡開始前，請先與親愛的領卡片", "卡片領取後，請交給親愛的導讀")
                        })
                    })
                }
            } else {
                failureAnswer {
                    self.addAlertController("你要想清楚誒", "我們再一起多久了")
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                        self.dismiss(animated: true)
                    })
                }
            }
            break
        case 5:
            if let answer = (self.answerList[self.questionCount] as? String), answer == enterTextField.text {
                correctAnswer {
                    self.confirmButton.isEnabled = false
                    self.addAlertController("即將進入下一關", "請稍候一下")
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                        self.questionCount += 1
                        self.questionLabel.text = self.questionList[self.questionCount]
                        
                        self.yesButton.isEnabled = true
                        self.yesButton.isHidden = false
                        self.yesLabel.isHidden = false
                        
                        self.noButton.isEnabled = true
                        self.noLabel.isHidden = false
                        self.noButton.isHidden = false
                        
                        self.enterStackView.isHidden = true
                        self.enterTextField.text = ""
                        self.confirmButton.isEnabled = false
                        self.dismiss(animated: true)
                    })
                }
            } else {
                failureAnswer {
                    self.addAlertController("你要看清楚誒", "難道是我數字藏的太好？")
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                        self.dismiss(animated: true)
                    })
                }
            }
            break
        default:
            self.addAlertController("系統故障", "請聯繫你尢修正")
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                self.dismiss(animated: true)
            })
            break
        }
    }
    
    @IBAction func yesAction(_ sender: Any) {
        guard questionCount < questionList.count - 1 else {
            correctAnswer {
                self.addAlertController("恭喜你將成為人妻", "請在卡片簽下你的名字，我們將邁入下個程序")
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                    self.dismiss(animated: true)
                    
                    let blurEffect = UIBlurEffect(style: .light)
                    let blurView = UIVisualEffectView(effect: blurEffect)
                    blurView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
                    self.view.addSubview(blurView)
                    
                    self.addAnimationView(jsonName: "dimond-ring", specificView: blurView.contentView, speed: 1, loopMode: .repeat(5), orignPosition: (x: 0, y: 0), frameTime: (from: 0, to: 300), completion: { finshed, animateView in
                        blurView.removeFromSuperview()
                    })
                })
            }
            return
        }
        
        questionCount += 1
        questionLabel.text = questionList[questionCount]
        correctAnswer() {
            self.yesButton.isEnabled = false
            self.noButton.isEnabled = false
            self.confirmButton.isEnabled = false
            self.addAlertController("即將進入下一關", "請稍候一下")
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
                switch self.questionCount {
                case 0,1,2,6,7,8:
                    self.yesButton.isEnabled = true
                    self.yesButton.isHidden = false
                    self.yesLabel.isHidden = false
                    
                    self.noButton.isEnabled = true
                    self.noLabel.isHidden = false
                    self.noButton.isHidden = false
                    
                    self.enterStackView.isHidden = true
                    self.confirmButton.isEnabled = false
                    
                    
                    break
                case 3,4,5:
                    self.yesButton.isEnabled = false
                    self.yesButton.isHidden = true
                    self.yesLabel.isHidden = true
                    
                    self.noButton.isEnabled = false
                    self.noButton.isHidden = true
                    self.noLabel.isHidden = true
                    
                    self.enterStackView.isHidden = false
                    self.confirmButton.isEnabled = true
                    
                    if self.questionCount == 3 {
                        ///rose-flower-sparks
                        let blurEffect = UIBlurEffect(style: .light)
                        let blurView = UIVisualEffectView(effect: blurEffect)
                        blurView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
                        self.view.addSubview(blurView)
                        self.addAnimationView(jsonName: "rose-flower-sparks", specificView: blurView.contentView, speed: 1, loopMode: .repeat(2), orignPosition: (x: 0, y: 0), frameTime: (from: 0, to: 300), completion: { finshed, animateView in
                            blurView.removeFromSuperview()
                            self.addAlertController("關卡開始前，請先與親愛的領獎", "")
                        })
                    }
                    break
                default:
                    break
                }
                
                self.dismiss(animated: true)
            })
        }
    }
    
    var rejectCount: Int = 0
    @IBAction func noAction(_ sender: Any) {
        guard questionCount < questionList.count - 1 else {
            switch rejectCount {
            case 0:
                failureAnswer {
                    self.addAlertController("你點錯邊囉", "檢查一下")
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
                        self.rejectCount += 1
                        self.dismiss(animated: true)
                    })
                }
                break
            case 1:
                failureAnswer {
                    self.addAlertController("你是不是手滑", "檢查一下")
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
                        self.rejectCount += 1
                        self.dismiss(animated: true)
                    })
                }
                break
            case 2:
                failureAnswer {
                    self.addAlertController("你確定你不嫁給我嗎？", "檢查一下")
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
                        self.rejectCount += 1
                        self.dismiss(animated: true)
                    })
                }
                break
            case 3:
                failureAnswer {
                    self.addAlertController("你沒有拒絕的餘地了", "檢查一下")
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
                        self.rejectCount += 1
                        self.dismiss(animated: true)
                    })
                }
                break
            case 4:
                failureAnswer {
                    self.addAlertController("恭喜你強制成為我的老婆", "你別想按到ＸＸ")
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
                        self.rejectCount += 1
                        self.noLabel.isHidden = true
                        self.noButton.isHidden = true
                        self.dismiss(animated: true)
                    })
                }
                break
            default:
                break
            }
            return
        }
        
        switch self.questionCount {
        case 0,1:
            failureAnswer() {
                self.addAlertController("想清楚喔", "按錯邊囉")
            }
            break
        case 2:
            failureAnswer() {
                self.addAlertController("怎麼可以不相信愛情", "按錯邊囉")
            }
            break
        case 6, 7, 8:
            failureAnswer() {
                self.addAlertController("看清楚卡片喔", "按錯邊囉")
            }
            break
        default:
            break
        }
        
    }
}

extension ContentViewController {
    func correctAnswer(completion: @escaping ()->()) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        self.view.addSubview(blurView)
        
        self.addAnimationView(jsonName: "successful", specificView: blurView.contentView, speed: 1, loopMode: .playOnce, orignPosition: (x: 0, y: 0), frameTime: (from: 0, to: 60), completion: { finshed, animateView in
            blurView.removeFromSuperview()
            completion()
        })
    }
    
    func failureAnswer(completion: @escaping ()->()) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        self.view.addSubview(blurView)
        
        self.addAnimationView(jsonName: "failure-cross", specificView: blurView.contentView, speed: 1, loopMode: .playOnce, orignPosition: (x: 0, y: 0), frameTime: (from: 0, to: 120), completion: { finshed, animateView in
            blurView.removeFromSuperview()
            completion()
        })
    }
    
    func addAlertController(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                self.dismiss(animated: true)
            })
        })
    }
}

extension ContentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        
        return true
    }
}
