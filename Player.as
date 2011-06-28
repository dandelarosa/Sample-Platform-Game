package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * Player character for a platform game
	 */
	public class Player extends Entity 
	{
		private var power:Number = 0.2;
		private var jumpPower:Number = 10;
		private var hFriction:Number = 0.95;
		private var vFriction:Number = 0.99;
		private var xSpeed:Number = 0;
		private var ySpeed:Number = 0;
		//private var onTheGround:Boolean = false;
		private var gravity:Number = 0.3;
		private var isJumping:Boolean=false;
		private var doubleJump:Boolean=false;
		
		// Embed player graphics
		[Embed(source='assets/player.png')]
		private const PLAYER:Class;
		private var playerSprite:Spritemap = new Spritemap(PLAYER,13,26);
		
		/**
		 * Constructor
		 */
		public function Player(x:Number, y:Number) 
		{
			setHitbox(13,26);
			this.x = x;
			this.y = y;
			playerSprite.add("goingLeft", [0], 1, false);
			playerSprite.add("goingRight", [1], 1, false);
			graphic = playerSprite;
		}
		
		/**
		 * Update player state each frame
		 */
		override public function update():void 
		{
		    // To calculate new x velocity
			var pressed:Boolean = false;
			if (Input.check(Key.LEFT)) 
			{
				xSpeed -= power;
				pressed = true;
			}
			if (Input.check(Key.RIGHT)) 
			{
				xSpeed += power;
				pressed = true;
			}
			if (Math.abs(xSpeed) < 1 && !pressed) 
			{
				xSpeed = 0;
			}
			xSpeed *= hFriction;
			
			// Calculate new y velocity
			if(!Input.check(Key.UP) && isJumping)
			{
				doubleJump=true;
			}
			if(Input.check(Key.UP) && doubleJump && isJumping){
				ySpeed = -jumpPower;
				isJumping = false;
				doubleJump = false;
			}
			if (collide("wall", x, y + 1))
			{
				ySpeed = 0;
				isJumping = false;
				if (Input.check(Key.UP))
				{
					ySpeed =- jumpPower;
					isJumping = true;
				}
			}
			else
			{
				ySpeed += gravity;
			}
			ySpeed *= vFriction;
			
			// Apply new speed, taking account collisions with walls
			moveBy(xSpeed, ySpeed, "wall");
			
			// Apply new image
			if(xSpeed > 0)
			{
				playerSprite.play("goingRight");
			}
			if(xSpeed < 0)
			{
				playerSprite.play("goingLeft");
			}
		}
		
		/*
		From ChevyRay:
        The moveBy() function will call these functions if it collides with a 
        "wall", and will actually also pass the wall instance they collide with 
        into them (e:Entity), so if you have further logic you want to evaluate 
        (eg. hitting on a trampoline if ySpeed > 0 and e is trampolineClass, 
        bounce) then you can do so.
        */
        
        /**
         * Process collisions while moving in the x direction
         */
		override public function moveCollideX(e:Entity):void
        {
            xSpeed = 0;
        }

        /**
         * Process collisions while moving in the y direction
         */
        override public function moveCollideY(e:Entity):void
        {
            ySpeed = 0;
        }
	}
}
