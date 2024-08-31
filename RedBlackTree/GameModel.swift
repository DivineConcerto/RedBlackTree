//
//  GameModel.swift
//  RedBlackTree
//
//  Created by 张炫阳 on 2024/8/31.
//

import Foundation


class Node{
    var value:Int
    var color:Int // 0代表黑，1代表红
    var father:Node?
    var leftChild:Node?
    var rightChild:Node?
    var level:Int{
        var num = 1
        var tempNode = self
        while (tempNode.father != nil){
            num += 1
            tempNode = tempNode.father!
        }
        return num
    }
    
    init(value: Int, color: Int, father: Node? = nil, leftChild: Node? = nil, rightChild: Node? = nil) {
        self.value = value
        self.color = color
        self.father = father
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    static var array:[Node] = []
}


class GameModel{
    
    var nodeList:[Node] = []
    
    // 检测当前结点是否是叶子结点
    func isLeafNode(testNode:Node) -> Bool{
        if testNode.leftChild == nil && testNode.rightChild == nil{
            return true
        }
        else{
            return false
        }
    }
    
    // 检测当前红黑树是否符合规则
    func isLegal(rootNode:Node) -> Bool{
        for node in Node.array{
            // 如果是偶数层，且为黑，则返回错误
            if (node.level % 2 == 0 && node.color == 0){
                return false
            }
            // 如果是奇数层且为红，则返回错误
            if( node.level % 2 == 1 && node.color == 1){
                return false
            }
        }
        return true
    }
    
    // 插入一个元素，为其寻找位置
    func findPosition(rootNode:Node,newNode:Node){
        // 如果大于，就往右边寻找空位
        if (newNode.value > rootNode.value){
            var tempNode = rootNode.rightChild
            // 如果是空位，就直接放下
            if tempNode == nil{
                rootNode.rightChild = newNode
                newNode.father = rootNode
            }
            // 如果不是空位,就尝试找到空位，然后放下
            else{
                findPosition(rootNode: tempNode!, newNode: newNode)
            }
        }
        // 如果小于，就往左边寻找空位
        else{
            var tempNode = rootNode.leftChild
            if tempNode == nil{
                rootNode.leftChild = newNode
                newNode.father = rootNode
            }
            else{
                findPosition(rootNode: tempNode!, newNode: newNode)
            }
        }
    }
    
    func rightSingleRound(node:Node){
        var fatherNode = node.father
        var candidateNodeRightChile = node.rightChild
        
        fatherNode?.leftChild = candidateNodeRightChile
        node.rightChild = fatherNode
        node.father = fatherNode?.father
        fatherNode?.leftChild = node
    }
    
    func reviseTree(rootNode:Node,newNode:Node){
        // 根据新结点的叔结点判断要执行的操作
        var uncleNode = rootNode
        // 获取到叔结点
        if let grandfatherNode = newNode.father?.father{
            if newNode.father!.value > grandfatherNode.value{
                uncleNode = grandfatherNode.leftChild!
            }
            else{
                uncleNode = grandfatherNode.rightChild!
            }
        }
        
        // 根据叔结点的颜色判断要执行的操作
        // 如果叔结点是黑色
        if uncleNode.color == 0{
            // 如果是LL型
            
            // 如果是RR型号
            
            // 如果是LR型号
            
            // 如果是RL型号
            
            // 染一圈颜色
        }
        // 如果叔结点是红色
        else{
            // 染色
            
            // 变新
        }
    }
    

    
    // 假设数组[4,3,5,8,7,1,6]
    func initialTree(numbers:[Int]) -> Node{
        var point = 0
        
        // 创建根结点
        var rootNode = Node(value: numbers[point], color: 0)
        Node.array.append(rootNode)
        
        // 循环插入每一个结点
        var lastNode = rootNode
        while(point<nodeList.count){
            point += 1
            // 创造下一个结点，并将其设置为红色结点
            var newNode = Node(value: numbers[point], color: 1)
            
            // 通过大小找到它该放的位置
            findPosition(rootNode: rootNode, newNode: newNode)
            Node.array.append(newNode)
            
            
            // 检查是否当前结构是否合格，如果合格就返回根结点
            if isLegal(rootNode: Node.array[0]){
                return rootNode
            }
            // 如果不合格，就开始玩那一套
            else{
                
            }
            
        }
        
        
        return rootNode
        
    
    }
    
    
    
    
    static let shared = GameModel()
    private init(){
        
    }
}
