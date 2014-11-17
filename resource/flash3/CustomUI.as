package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	//import some stuff from the valve lib
	import ValveLib.Globals;
	import ValveLib.ResizeManager;
	
	public class CustomUI extends MovieClip{
		
		//these three variables are required by the engine
		public var gameAPI:Object;
		public var globals:Object;
		public var elementName:String;

		//constructor, you usually will use onLoaded() instead
		var kg:Number=0;
		public function CustomUI() : void {
			trace("start this ui");
			
			this.an.addEventListener(MouseEvent.CLICK,onMenu_an);
			
			this.wtf.visible=false;
		}

		
		//this function is called when the UI is loaded
		public function onLoaded() : void {			
			//make this UI visible
			visible = true;
			trace("start onloaded");
		
			//let the client rescale the UI
			Globals.instance.resizeManager.AddListener(this);
			
			//this is not needed, but it shows you your UI has loaded (needs 'scaleform_spew 1' in console)
			trace("Custom UI loaded!!!!!!!!");
			this.wtf.setup(this.gameAPI,this.globals);
			this.pmb.setup(this.gameAPI,this.globals);
			
		}
		 
		 public function onMenu_an(dd:MouseEvent):void
		{
			trace("about");
			//this.mTaskPanel.CreateBtn();
		    if (kg==0) {
			  this.wtf.visible=true;
			  kg=1;
			}else {
				this.wtf.visible=false;
				kg=0;
			}
		   
		 //  this.mTaskPanel.CreateBtn();
			
		}
						
		//this handles the resizes - credits to Nullscope
		public function onResize(re:ResizeManager) : * {

			var ycorrec:Number= stage.stageHeight/5*3;
			
			wtf.y=ycorrec;
			an.y=ycorrec;
			pmb.y=ycorrec;
			
			wtf.x=0;
			an.x=0;
			pmb.x=0;
		    
			
                    
            //You will probably want to scale your elements by here, they keep the same width and height by default.

            //The engine keeps elements at the same X and Y coordinates even after resizing, you will probably want to adjust that here.
		}
	}
}