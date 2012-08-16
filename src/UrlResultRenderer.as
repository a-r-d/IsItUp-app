package
{
	import components.UrlResultComponent;
	
	import spark.components.LabelItemRenderer;
	
	public class UrlResultRenderer  extends LabelItemRenderer
	{
		private var urlResult:UrlResultComponent = new UrlResultComponent();
		
		
		public function UrlResultRenderer()
		{
			this.addChild(urlResult);
		}
		
		// this is where everything happens:
		override public function set data(value:Object):void
		{
			this.labelDisplay = null;	
			
			// cast incoming object as XML.
			var thisUrlxml:XML = XML(value);
			
			urlResult.last = thisUrlxml.last.toString();
			urlResult.time = thisUrlxml.time.toString();
			urlResult.latency = thisUrlxml.latency.toString();
			urlResult.url = thisUrlxml.address.toString();
			
			
			// set colors:
			trace("last code: " + urlResult.last);
			if(urlResult.last == "200") {
				urlResult.lblLast.setStyle("color", "Green");
			} else if(urlResult.last == "404") {
				urlResult.lblLast.setStyle("color", "Yellow");
			}else {
				urlResult.lblLast.setStyle("color", "Red");
			}
			
			
		}
		
		// get rid og the label
		override public function set label(value:String):void
		{
			
		}
		
		
		// Override this other shit:
		/**
		 * @private
		 * 
		 * Override this method to create children for your item renderer 
		 */	
		override protected function createChildren():void
		{
			//super.createChildren();
			// create any additional children for your item renderer here
		}
		
		/**
		 * @private
		 * 
		 * Override this method to change how the item renderer 
		 * sizes itself. For performance reasons, do not call 
		 * super.measure() unless you need to.
		 */ 
		override protected function measure():void
		{
			this.measuredHeight = urlResult.height + 5;
			this.measuredWidth = urlResult.width; 	
			/*trace("MMW" + measuredMinWidth);
			trace("MW" + measuredWidth);
			if(hitArea != null)
			trace("HW" + this.hitArea.width);
			*/
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
		
		/**
		 * @private
		 *  
		 * Override this method to change how the background is drawn for this 
		 * item renderer. For performance reasons, do not call 
		 * super.layoutContents() if you do not need to.
		 */
		override protected function layoutContents(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{  		
		}
		
		
	}
}