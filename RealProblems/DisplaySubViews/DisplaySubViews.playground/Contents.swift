import UIKit

//! Sample View
class CustomView: UIView {
    /* Expected OutPut
     customView
        aView
            aButton
            aView2
            aLabel
        aView3
            aView4
                aView5
                    aButton2
                    aButton3
                aLabel2
     */
    func generateSubViews() {
        let aView: UIView = UIView()
        self.addSubview(aView)
        
        let aButton: UIButton = UIButton()
        let aView2: UIView = UIView()
        let aLabel: UILabel = UILabel()
        aView.addSubview(aButton)
        aView.addSubview(aView2)
        aView.addSubview(aLabel)
        
        let aView3: UIView = UIView()
        self.addSubview(aView3)
        
        let aView4: UIView = UIView()
        aView3.addSubview(aView4)
        
        let aView5: UIView = UIView()
        let aLabel2: UILabel = UILabel()
        aView4.addSubview(aView5)
        aView4.addSubview(aLabel2)
        
        let aButton2: UIButton = UIButton()
        let aButton3: UIButton = UIButton()
        aView5.addSubview(aButton2)
        aView5.addSubview(aButton3)
    }
}


var tapStringMap: [Int: String] = [:]
func tapString(byDepth depth: Int) -> String {
    if depth == 0 {
        return ""
    }
    
    if depth == 1 {
        return "\t"
    }
    
    if let rtnTapString = tapStringMap[depth] {
        return rtnTapString
    }
    
    let rtnTapString: String = tapString(byDepth: depth - 1).appending("\t")
    tapStringMap[depth] = rtnTapString
    return rtnTapString
}

func displaySubViews(view: UIView, depth: Int) {
    let tap: String = tapString(byDepth: depth)
    print("\(tap)\(view.description)")
    
    for view in view.subviews {
        displaySubViews(view: view, depth: depth + 1)
    }
}

//! Starts from Here
let customView: CustomView = CustomView()
customView.generateSubViews()

displaySubViews(view: customView, depth: 0)




