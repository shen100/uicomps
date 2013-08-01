package com.shen.uicomps.components.skin {
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ScrollBarSkin extends Sprite {
		
		private var _asset:DisplayObject;
		
		public function ScrollBarSkin(asset:DisplayObject = null) {
			mouseChildren = false;
			if(asset) {
				_asset = asset;
				(_asset as Object).thumb.x = 0;
				(_asset as Object).thumb.y = 0;
				(_asset as Object).trackFace.x = 0;
				(_asset as Object).trackFace.y = 0;
				(_asset as Object).trackBack.x = 0;
				(_asset as Object).trackBack.y = 0;
			}
		}
		
		public function get asset():DisplayObject {
			return _asset;
		}
		
		public function set asset(value:DisplayObject):void {
			if(value) {
				_asset = value;
				(_asset as Object).thumb.x = 0;
				(_asset as Object).thumb.y = 0;
				(_asset as Object).trackFace.x = 0;
				(_asset as Object).trackFace.y = 0;
				(_asset as Object).trackBack.x = 0;
				(_asset as Object).trackBack.y = 0;
			}
		}
	
		public function get thumbAsset():MovieClip {
			return (_asset as Object).thumb;
		}
		
		public function get trackFaceAsset():DisplayObject {
			return (_asset as Object).trackFace;
		}
		
		public function get trackBackAsset():DisplayObject {
			return (_asset as Object).trackBack;
		}
	}
}














