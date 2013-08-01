package com.shen.uicomps.components 
{
	import com.shen.uicomps.components.skin.ButtonSkin;
	import com.shen.uicomps.components.skin.ScrollBarSkin;
	import com.shen.uicomps.components.skin.Skin;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import caurina.transitions.Tweener;
	
	public class HScrollBar extends Sprite {
	
		private var _skin:ScrollBarSkin;
		
		private var thumb:Button;
		private var trackBack:SkinnableComponent;
		private var trackFace:SkinnableComponent;
		private var trackFaceMask:Sprite;
		
		private var _value:Number = 1;
		
		public function HScrollBar() {
			buttonMode = true;
			trackBack = new SkinnableComponent();
			addChild(trackBack);
			
			trackFace = new SkinnableComponent();
			addChild(trackFace);
			
			thumb = new Button();
			addChild(thumb);
			
			trackFaceMask = new Sprite();
			addChild(trackFaceMask);
			
			trackFace.mask = trackFaceMask;
			
			thumb.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownThumb);
			trackBack.addEventListener(MouseEvent.CLICK, onClick);
			trackFace.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void {
			var x:Number = event.localX;
			var tempValue:Number = x / trackBack.width;
			if(_value != tempValue) {
				_value = tempValue;
				trackFaceMask.width = x;
				Tweener.addTween(trackFaceMask, {width:x, time:0.3});
				Tweener.addTween(thumb, {x:x, time:0.3, onComplete:function():void{dispatchEvent(new Event(Event.CHANGE));}});
			}
		}
		
		private function onTrackBackClick(event:MouseEvent):void {
			
		}
		
		public function get skin():ScrollBarSkin {
			return _skin;
		}
		
		public function set skin(scrollBarSkin:ScrollBarSkin):void {
			trackBack.skin = new Skin(scrollBarSkin.trackBackAsset);
			trackFace.skin = new Skin(scrollBarSkin.trackFaceAsset);
			thumb.skin = new ButtonSkin(scrollBarSkin.thumbAsset);
			trackFaceMask.graphics.beginFill(0x000000);
			trackFaceMask.graphics.drawRect(0, -trackFace.height / 2, trackFace.width, trackFace.height);
			trackFaceMask.graphics.endFill();
			
			thumb.x = trackBack.width;
		}
		
		private function onMouseDownThumb(event:MouseEvent):void {
			var bounds:Rectangle = new Rectangle(0, 0, trackBack.width, 0);
			thumb.startDrag(false, bounds);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpStage);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void {
			trackFaceMask.width = thumb.x;
			var tempValue:Number = thumb.x / trackBack.width;
			if(_value != tempValue) {
				_value = tempValue;
				dispatchEvent(new Event(Event.CHANGE));	
			}
		}
		
		private function onMouseUpStage(event:MouseEvent):void {
			thumb.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpStage);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}	
		
		public function get value():Number {
			return _value;
		}
		
		public function set value(value:Number):void {
			_value = value;
			thumb.x = trackBack.width * value;
			trackFaceMask.width = thumb.x;
		}
	}
}






















