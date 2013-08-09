package com.shen100.uicomps.components
{
	import flash.display.Shape;

	public class DottedLine extends Shape
	{
		private var _dotLen:Number;
		private var _spacing:Number;
		private var _thickness:Number;
		private var _color:Number;
		
		public function DottedLine(dotLen:Number, spacing:Number, thickness:Number=1, color:uint=0x000000)
		{
			_dotLen = dotLen;
			_spacing = spacing;
			_thickness = thickness;
			_color = color;
		}
		
		public function lineTo(value:Number):void {
			graphics.lineStyle(_thickness, _color);
			graphics.moveTo(0, 0);
			var totalLen:Number = 0;
			var x:Number = _dotLen;
			while(true) {
				graphics.lineTo(x, 0);
				totalLen = x + _spacing;
				if(totalLen >= value) {
					break;	
				}
				graphics.moveTo(totalLen, 0);
				x = totalLen + _dotLen;
				if(x > value) {
					x = value;	
				}
			}
		}
	}
}















