import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(UIDevice.current.orientation.isPortrait){
            if(position.y <= -902)
            {
                Reset()
            }
        }else
        {
            if(position.x <= -902)
            {
                Reset()
            }
        }
    }
    
    override func Reset()
    {
        if(UIDevice.current.orientation.isPortrait){
            // randomize the vertical speed: 5 to 10
            verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
            
            // randomize the horizontal speed: -2 to 2
            horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
            
            // get a pseudo random number for the X position: -262 to 262
            let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
            position.x = CGFloat(randomX)
            
            // get a pseudo random number for the Y position: 902 to 932
            let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 902
            position.y = CGFloat(randomY)
            
            isColliding = false
        }else
        {
            // randomize the vertical speed: 5 to 10
            verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
            
            // randomize the horizontal speed: -2 to 2
            horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
            
            // get a pseudo random number for the Y position: -262 to 262
            let randomY:Int = (randomSource?.nextInt(upperBound: 524))! - 262
            position.y = CGFloat(randomY)
            
            // get a pseudo random number for the X position: 902 to 932
            let randomX:Int = (randomSource?.nextInt(upperBound: 30))! + 902
            position.x = CGFloat(randomX)
            
            isColliding = false
        }
    }
    
    // public method
    func Move()
    {
        if(UIDevice.current.orientation.isPortrait){
            position.x -= horizontalSpeed!
            position.y -= verticalSpeed!
        }else
        {
            position.y -= horizontalSpeed!
            position.x -= verticalSpeed!
        }
    }
}
