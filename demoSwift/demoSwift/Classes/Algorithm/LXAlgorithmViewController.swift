//
//  LXAlgorithmViewController.swift
//  demoSwift
//
//  Created by asdc on 2020/8/11.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class LXAlgorithmViewController: UIViewController {
    
    public let sectionTitleArray = ["Math", "Algorithm", "Animation", "Irregular", "Customize click", "Remind", "Lottie"]
    public let sectionSubtitleArray = ["数学实现题", "算法实现题", "动画", "不规则", "自定义点击", "提醒", "Lottie"]
    public let titleArray = [
        [
            "斐波那契数列实现",
        ],
        [
            "冒泡排序实现",
            "选择排序实现",
            ],
        [
            "Customize the selected color style",
            "Spring animation style",
            "Background color change style",
            "With a selected effect style",
            "Suggested clicks style",
            ],
        [
            "In the middle with a larger button style",
            ],
        [
            "Hijack button click event",
            "Add a special reminder box",
            ],
        [
            "System remind style",
            "Imitate system remind style",
            "Remind style with animation",
            "Remind style with animation(2)",
            "Customize remind style",
            ],
        [
            "Lottie",
            ],
        ]

    public let subtitleArray = [
        [
            "给定初始两个值, 第三位起, 每一项位前两位之和, 任意输入第几位数字, 会给我返回正确结果",
        ],
        [
            "它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来",
            "在每个步骤中，都是在数组的其余部分里搜索选择下一个最小数字",
            ],
        [
            "自定义选中颜色样式",
            "弹簧动画样式",
            "背景颜色变化样式",
            "带有选中效果样式",
            "暗示用户点击样式",
            ],
        [
            "中间带有较大按钮样式",
            ],
        [
            "劫持按钮的点击事件",
            "添加一个特殊的提醒框",
            ],
        [
            "系统提醒样式",
            "仿系统提醒样式",
            "带动画提醒样式",
            "带动画提醒样式(2)",
            "自定义提醒样式",
            ],
        [
            "Lottie",
            ],
        ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        setupLayout()
    }
}

extension LXAlgorithmViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray[section].count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42.0
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section] + " " + "(" + sectionSubtitleArray[section] + ")"
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")

        cell.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell.textLabel?.lineBreakMode = .byCharWrapping
        cell.textLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1) \(titleArray[indexPath.section][indexPath.row])"
        cell.textLabel?.numberOfLines = 2

        cell.detailTextLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.5)
        cell.detailTextLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 11.0)
        cell.detailTextLabel?.text = "\(subtitleArray[indexPath.section][indexPath.row])"
        cell.detailTextLabel?.numberOfLines = 2

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                self.didSelectRowAtFibonacci()
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                self.didSelectRowAtBubblesort()
            case 1:
                self.didSelectRowAtSelectsort()
            default:
                break
            }
        default:
            break
        }
        
    }
}

extension LXAlgorithmViewController {
    func didSelectRowAtSelectsort() {
        let array = [5,8,3,4,6]
        let preArray = selectSort(array)
        print("selectSort Array = \(preArray)")
    }
    
    func selectSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        var preArray = array
        for i in 0..<preArray.count {
            var min = i
            for j in i+1..<preArray.count {
                if preArray[j] < preArray[min] {
                    min = j
                }
            }
            if min != i {
                preArray.swapAt(i, min)
            }
        }
        
        return preArray
    }
}

extension LXAlgorithmViewController {
    func didSelectRowAtBubblesort() {
        let array = [3, 44, 38, 5, 47]
        let preArray = bubbleSort(array)
        print("bubbleSort Array = \(preArray)")
    }
    
    func bubbleSort(_ array: [Int]) -> [Int] {
        if array.isEmpty {
            return []
        }
        
        var preArray = array
        for i in 0..<preArray.count {
            print("i = \(i)")
            for j in 0..<preArray.count - 1 - i {
                print("j = \(j) array[j] = \(preArray[j]) array[j+1] = \(preArray[j+1])")
                if preArray[j] > preArray[j+1] {
                    let temp = preArray[j+1]
                    preArray[j+1] = preArray[j]
                    preArray[j] = temp
                }
            }
        }
        return preArray
    }
}
extension LXAlgorithmViewController {
    // 数学家斐波那契在自己的著作中用兔子繁殖模型引入了这样一个数列：1，1，2，3，5，8，13... // 0, 1，1，2，3，5，8，13... 从n = 0 开始
    // 这个数列的第1项和第2项都为1，以后的项都是前面两项之和
    func didSelectRowAtFibonacci() {
        let getNum = Fibonacci(n: 10)
        print("斐波那契 Number = \(getNum)")
    }
    
    func Fibonacci(n: Int) -> Int {
        if n == 1 || n == 2 {
            return 1
        }else if n > 2{
            return Fibonacci(n: n - 2) + Fibonacci(n: n - 1)
        }else {
            return 0
        }
    }
}
