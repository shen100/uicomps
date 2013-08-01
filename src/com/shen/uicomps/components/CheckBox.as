package com.shen.uicomps.components
{
	import com.shen.uicomps.components.skin.CheckBoxSkin;
	import com.shen.uicomps.components.skin.RadioButtonSkin;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class CheckBox extends Sprite {
		
		public static const SELECT_UP:String 			= "selectUp";
		public static const SELECT_OVER:String 			= "selectOver";
		public static const SELECT_DOWN:String 			= "selectDown";
		public static const SELECT_DISABLED:String 		= "selectDisabled";
		public static const UNSELECT_UP:String 			= "unSelectUp";
		public static const UNSELECT_OVER:String 		= "unSelectOver";
		public static const UNSELECT_DOWN:String 		= "unSelectDown";
		public static const UNSELECT_DISABLED:String 	= "unSelectDisabled";
		
		private var _selected:Boolean = false;
		
		private var _skin:CheckBoxSkin;
		private var _currentState:String;
		
		public function CheckBox(checked:Boolean = false, defaultHandler:Function = null)
		{
			_selected = checked;
			buttonMode = true;
			
			addEventListener(MouseEvent.CLICK, onClick);
			
			if(defaultHandler != null) {
				addEventListener(MouseEvent.CLICK, defaultHandler);
			}
		}
	
		public function get skin():CheckBoxSkin {
			return _skin;
		}
		
		public function get label():String {
			if(_skin) {
				return _skin.label;	
			}
			return "";
		}
		
		public function set label(value:String):void {
			if(_skin) {
				_skin.label = value;
			}
		}
		
		public function set skin(checkBoxSkin:CheckBoxSkin):void {
			if(_skin) {
				removeChild(_skin);	
			}
			_skin = checkBoxSkin;
			addChild(_skin);
			
			if(selected) {
				currentState = CheckBox.SELECT_UP;
			}else {
				currentState = CheckBox.UNSELECT_UP;	
			}
			addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
		}
		
		
		private function onMouseOver(event:MouseEvent):void
		{
			addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
			if(selected == false) {
				currentState = RadioButton.UNSELECT_OVER;
			}else {
				currentState = RadioButton.SELECT_OVER;	
			}
		}
		
		protected function onMouseOut(event:MouseEvent):void
		{
			removeEventListener(MouseEvent.ROLL_OUT, onMouseOut);
			if(selected == false) {
				currentState = RadioButton.UNSELECT_UP;
			}else {
				currentState = RadioButton.SELECT_UP;	
			}
		}
		
		protected function onClick(event:MouseEvent):void {
			selected = !selected;
		}
		
		public function set selected(s:Boolean):void {
			var lastSelected:Boolean = _selected;
			_selected = s;
			if(_selected) {
				currentState = RadioButton.SELECT_UP;
			}else {
				if(lastSelected) {
					currentState = RadioButton.UNSELECT_UP;
				}
			}
		}
		
		public function get selected():Boolean {
			return _selected;
		}
	
		public function get currentState():String {
			return _currentState;
		}
		
		public function set currentState(value:String):void {
			if(_currentState != value) {
				_currentState = value;
				if(_skin) {
					switch(_currentState) {
						case CheckBox.SELECT_OVER:{
							_skin.selectOver();
							break;
						}
						case CheckBox.UNSELECT_OVER:{
							_skin.unSelectOver();
							break;
						}
						case CheckBox.SELECT_UP:{
							_skin.selectUp();
							break;
						}
						case CheckBox.UNSELECT_UP:{
							_skin.unSelectUp();
							break;
						}
						case CheckBox.SELECT_DOWN:{
							_skin.selectDown();
							break;
						}
						case CheckBox.UNSELECT_DOWN:{
							_skin.unSelectDown();
							break;
						}
						case CheckBox.SELECT_DISABLED:{
							_skin.selectDisabled();
							break;
						}
						case CheckBox.UNSELECT_DISABLED:{
							_skin.unSelectDisabled();
							break;
						}
					}
				}
			}
		}
	}
}











