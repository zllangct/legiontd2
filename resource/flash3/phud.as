package  {
	import flash.display.MovieClip;

	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.geom.Point;
	import flash.text.TextLineMetrics;
	import ValveLib.Globals;
	
	public class phud extends MovieClip {
		
		public var gameAPI:Object;
		public var globals:Object;
		public var elementName:String;
		
		public function setup(api:Object,glob:Object): * {
          this.gameAPI = api;
		  this.globals = glob;
     
          //这是我们的事件的监听器
          this.gameAPI.SubscribeToGameEvent("p_update", this.updateui2);
		  trace("phud ui init complete")
        }
		
		public function phud() {
			// constructor code
		}
		
		 public function updateui2(args:Object) : * {
			 
              trace("jajaja");
              var pID:int = globals.Players.GetLocalPlayer();
			  trace(pID);
			  trace(args.pp1);
			  switch(pID) {
                
			     case 0:this.gold.text=args.pp1;break;
				 case 1:this.gold.text=args.pp2;break;
				 case 2:this.gold.text=args.pp3;break;
				 case 3:this.gold.text=args.pp4;break;
				 case 5:this.gold.text=args.pp5;break;
				 case 6:this.gold.text=args.pp6;break;
				 case 7:this.gold.text=args.pp7;break;
			     case 8:this.gold.text=args.pp8;break;
			  }

            }
		
		
	}
	
}
