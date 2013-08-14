package com.shen100.uicomps.components.skin
{
	import com.shen100.uicomps.components.Label;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class RadioButtonSkin extends Sprite
	{	
		private var gap:Number = 5;
		private var _asset:MovieClip;
		protected var _label:Label;
		
		public function RadioButtonSkin(asset:MovieClip = null) {
			mouseChildren = false;
			this.asset = asset;
		}
		
		public function set asset(value:MovieClip):void {
			if(value) {
				if(_asset != null) {
					removeChild(_asset);	
				}
				_asset = value;
				addChild(_asset);	
			}
		}
		
		public function get asset():MovieClip {
			return _asset;
		}
		
		public function selectUp():void {
			_asset.gotoAndStop("select_up");
		}
		
		public function selectOver():void {
			_asset.gotoAndStop("select_over");
		}
		
		public function selectDown():void {
			_asset.gotoAndStop("select_down");	
		}
		
		public function selectDisabled():void {
			_asset.gotoAndStop("select_disabled");	
		}
		
		public function unSelectUp():void {
			_asset.gotoAndStop("unselect_up");
		}
		
		public function unSelectOver():void {
			_asset.gotoAndStop("unselect_over");
		}
		
		public function unSelectDown():void {
			_asset.gotoAndStop("unselect_down");	
		}
		
		public function unSelectDisabled():void {
			_asset.gotoAndStop("unselect_disabled");	
		}

		public function get label():String {
			if(_label) {
				return _label.text;	
			}
			return "";
		}

		public function set label(value:String):void {
			if(!_label) {
				_label = new Label();
				addChild(_label);
			}
			_label.text = value;
			_label.textColor = 0xFFFFFF;
			if(_asset) {
				_label.x = _asset.width + gap;
				_label.y = (_asset.height - _label.height) / 2;
			}
			
		}
		
		public function set textSize(value:Object):void {
			_label.textSize = value;
			_label.x = _asset.width + gap;
			_label.y = (_asset.height - _label.height) / 2;
		}

	}
}








