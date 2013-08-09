package com.shen100.uicomps.components.skin {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ButtonSkin extends Sprite {
		
		private var _asset:MovieClip;
		
		public function ButtonSkin(asset:MovieClip = null) {
			mouseChildren = false;
			this.asset = asset;
		}
		
		public function set asset(value:MovieClip):void {
			if(value) {
				if(_asset != null) {
					removeChild(_asset);	
				}
				_asset = value;
				_asset.gotoAndStop("up");
				addChild(_asset);	
			}
		}
		
		override public function set height(value:Number):void {
			if(_asset) {
				_asset.height = value;
			}
		}
		
		override public function set width(value:Number):void {
			if(_asset) {
				_asset.width = value;
			}
		}
		
		public function get asset():MovieClip {
			return _asset; 
		}
		
		public function set label(value:String):void {
			_asset.txt.text = value;	
		}
		
		public function get label():String {	
			if(_asset.txt) {
				return _asset.txt.text;
			}
			return null;
		}

		public function up():void {
			_asset.gotoAndStop("up");
		}
		
		public function over():void {
			_asset.gotoAndStop("over");
		}
		
		public function down():void {
			_asset.gotoAndStop("down");	
		}
		
		public function disable():void {
			_asset.gotoAndStop("disabled");	
		}
	}
}
