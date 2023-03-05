import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -2253){
            Reset()
        }
        if(position.x <= -1015){
            Reset()
        }
    }
    
    override func Reset()
    {
        if(UIDevice.current.orientation.isLandscape){
            position.y = 0
            position.x = 1015
        }else
        {
            
            position.y = 2253
            position.x = 0
        };
    }
    
    func Move()
    {
        if(UIDevice.current.orientation.isPortrait){
            position.y -= verticalSpeed!
            
        }else
        {
            position.x -= verticalSpeed!
        };
        
    }
}
