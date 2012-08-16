package skins
{
	import mx.core.BitmapAsset;
	import mx.graphics.BitmapFill;
	import mx.graphics.BitmapFillMode;
	
	import spark.components.Group;
	import spark.components.Image;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	import spark.skins.mobile.TabbedViewNavigatorApplicationSkin;
	
	public class BgSkinClass extends TabbedViewNavigatorApplicationSkin
	{
		private var image:Image;
		
		[Embed(source="/assets/back.png")]
		private var background:Class;
		
		private var group:Group = new Group();
		
		public function BgSkinClass()
		{
			super();
		}
		
		override protected function drawBackground(w:Number, h:Number):void{
			super.drawBackground(w,h);
			group.height=h;
			group.width=w;
		}
		
		override protected function createChildren():void {

			var rec:Rect = new Rect();
			var bitmapFill:BitmapFill = new BitmapFill();
			rec.percentHeight=100;
			rec.percentWidth=100;
			bitmapFill.source =(new background() as BitmapAsset);
			bitmapFill.fillMode = BitmapFillMode.REPEAT;
			rec.fill = bitmapFill;
			
			group.addElement(rec);
			this.addChild(group);
			super.createChildren();
			
		}
	}
} 