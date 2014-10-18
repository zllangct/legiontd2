package  {
	
	import flash.display.MovieClip;

	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.geom.Point;
	import flash.text.TextLineMetrics;
	import ValveLib.Globals;
	
	
	public class hud extends MovieClip {
				//these three variables are required by the engine
		public var gameAPI:Object;
		public var globals:Object;
		public var elementName:String;
		
		public function setup(api:Object,glob:Object): * {
          this.gameAPI = api;
		  this.globals = glob;
     
          //这是我们的事件的监听器，onGoldUpdate（）是处理器
          this.gameAPI.SubscribeToGameEvent("ui_update", this.updateui);
		  trace("ui init complete")
        }
		public function hud() {
			// constructor code
		}
		 public function updateui(args:Object) : * {
			  trace("start ui update");
			  trace(args.player1);
              this.playergold1.text=args.player1;
              this.playergold2.text=args.player2;
			  this.playergold3.text=args.player3;
			  this.playergold4.text=args.player4;
			  this.playergold5.text=args.player5;
			  this.playergold6.text=args.player6;
			  this.playergold7.text=args.player7;
			  this.playergold8.text=args.player8;
            }
	}
	
}
