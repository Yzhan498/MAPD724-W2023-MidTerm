import GameplayKit
import SpriteKit

class Island : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(UIDevice.current.orientation.isPortrait)
        {
            if(position.y <= -876)
            {
                Reset()
            }
        }else
        {
                if(position.x <= -876)
                {
                    Reset()
                }
        }
    }
    
    override func Reset()
    {
        if(UIDevice.current.orientation.isPortrait)
        {
            position.y = 876
            // get a pseudo random number
            let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
            position.x = CGFloat(randomX)
            isColliding = false
        }else
        {
            position.x = 876
            // get a pseudo random number
            let randomY:Int = (randomSource?.nextInt(upperBound: 626))! - 313
            position.y = CGFloat(randomY)
            isColliding = false
        }
       
    }
    
    // public method
    func Move()
    {
        if(UIDevice.current.orientation.isPortrait)
        {
            position.y -= verticalSpeed!
        }else
        {
            position.x -= verticalSpeed!
        }
    }
}
