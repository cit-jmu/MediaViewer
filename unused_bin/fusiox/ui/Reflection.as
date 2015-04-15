package com.fusiox.ui {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	public class Reflection extends UIComponent {
		
		public var target:UIComponent;
		public var bitmap:Bitmap = new Bitmap(new BitmapData( 1, 1, true, 0 ));
		public var gr:Graphics;
		public var fadeFrom:Number = 0.3;
		public var fadeTo:Number = 0;
		public var fadeCenter:Number = 0.5;
		public var skewX:Number = 0;
		public var scale:Number = 1;
		
		public function Reflection():void {
			addChild(bitmap);
			bitmap.smoothing = true;
			//addEventListener( FlexEvent.CREATION_COMPLETE, drawReflection );
			//addEventListener( Event.ENTER_FRAME, drawReflection );
		}
		public function removeReflection():void {
			bitmap.bitmapData.dispose();
		}
		public function drawReflection( e:Event = null ):void {
			if (target == null) return;
			this.width = target.width;
			this.height = target.height * .07;
			if( this.width>0 && this.height>0 ) {

				//draw reflection
				var bitmapData:BitmapData = new BitmapData(this.width, this.height, true, 0);
				var matrix:Matrix = new Matrix( 1, 0, skewX, -1*scale, 0, target.height );
				var rectangle:Rectangle = new Rectangle(0,0,this.width,this.height*(2-scale));
				var delta:Point = matrix.transformPoint(new Point(0,target.height));
				matrix.tx = delta.x*-1;
				matrix.ty = (delta.y-target.height)*-1;
				bitmapData.draw(target, matrix, null, null, rectangle, true);
				
				//add fade
				var shape:Shape = new Shape();
				var gradientMatrix:Matrix = new Matrix();
				gradientMatrix.createGradientBox(this.width,this.height, 0.5*Math.PI);
				shape.graphics.beginGradientFill(GradientType.LINEAR, new Array(0,0,0), new Array(fadeFrom,(fadeFrom-fadeTo)/2,fadeTo), new Array(0,0xFF*fadeCenter,0xFF), gradientMatrix)
				shape.graphics.drawRect(0, 0, this.width, this.height);
				shape.graphics.endFill();
				bitmapData.draw(shape, null, null, BlendMode.ALPHA);
				
				//apply result
				bitmap.bitmapData.dispose();
				bitmap.bitmapData = bitmapData;
				this.x = target.x;
				this.y = target.y + target.height;
			}
		}
		
	}
}