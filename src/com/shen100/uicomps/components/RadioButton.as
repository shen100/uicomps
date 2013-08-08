package com.shen100.uicomps.components
{
	import com.shen100.uicomps.components.skin.RadioButtonSkin;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class RadioButton extends Sprite {
		
		public static const SELECT_UP:String 			= "selectUp";
		public static const SELECT_OVER:String 			= "selectOver";
		public static const SELECT_DOWN:String 			= "selectDown";
		public static const SELECT_DISABLED:String 		= "selectDisabled";
		public static const UNSELECT_UP:String 			= "unSelectUp";
		public static const UNSELECT_OVER:String 		= "unSelectOver";
		public static const UNSELECT_DOWN:String 		= "unSelectDown";
		public static const UNSELECT_DISABLED:String 	= "unSelectDisabled";
	
		
		public static var buttons:Array;
		
		private var _selected:Boolean = false;
		private var _groupName:String = "defaultRadioButtonGroup";
		
		private var _skin:RadioButtonSkin;
		private var _currentState:String;
		private var _vaule:Object;
		
		public function RadioButton(groupName:String = "defaultRadioButtonGroup", checked:Boolean = false, defaultHandler:Function = null)
		{
			RadioButton.addButton(this);
			_groupName = groupName;
			_selected = checked;
			buttonMode = true;
			
			addEventListener(MouseEvent.CLICK, onClick);
		
			if(defaultHandler != null) {
				addEventListener(MouseEvent.CLICK, defaultHandler);
			}
		}
		
		private static function addButton(rb:RadioButton):void {
			if(buttons == null)
			{
				buttons = new Array();
			}
			buttons.push(rb);
		}
		
		public static function deleteGroup(groupName:String):void {
			for (var i:int = buttons.length - 1; i >= 0; i--) {
				var radioButton:RadioButton = buttons[i];
				if(radioButton.groupName == groupName) {
					buttons.splice(i, 1);
				}	
			}
		}
		
		private static function clear(rb:RadioButton):void {
			for(var i:uint = 0; i < buttons.length; i++)
			{
				if(buttons[i] != rb && buttons[i].groupName == rb.groupName)
				{
					buttons[i].selected = false;
				}
			}
		}
		
		public function get skin():RadioButtonSkin {
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
		
		public function set textSize(value:Object):void {
			_skin.textSize = value;
		}
		
		public function set skin(radioButtonSkin:RadioButtonSkin):void {
			if(_skin) {
				removeChild(_skin);	
			}
			_skin = radioButtonSkin;
			addChild(_skin);
			
			if(selected) {
				currentState = RadioButton.SELECT_UP;
			}else {
				currentState = RadioButton.UNSELECT_UP;	
			}
			addEventListener(MouseEvent.ROLL_OVER, 	onMouseOver);
			addEventListener(MouseEvent.ROLL_OUT, 	onMouseOut);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
	
		private function onMouseOver(event:MouseEvent):void
		{
			if(selected == false) {
				currentState = RadioButton.UNSELECT_OVER;
			}else {
				currentState = RadioButton.SELECT_OVER;	
			}
		}
		
		protected function onMouseOut(event:MouseEvent):void
		{
			if(selected == false) {
				currentState = RadioButton.UNSELECT_UP;
			}else {
				currentState = RadioButton.SELECT_UP;	
			}
		}
		
		private function onMouseDown(event:MouseEvent):void {
			if(selected == false) {
				currentState = RadioButton.UNSELECT_DOWN;	
			}else {
				currentState = RadioButton.SELECT_DOWN;		
			}
		}
		
		protected function onClick(event:MouseEvent):void {
			selected = true;
		}
		
		public function set selected(s:Boolean):void {
			var lastSelected:Boolean = _selected;
			_selected = s;
			if(_selected) {
				currentState = RadioButton.SELECT_UP;
				RadioButton.clear(this);
			}else {
				if(lastSelected) {
					currentState = RadioButton.UNSELECT_UP;
				}
			}
		}
		
		public function get selected():Boolean {
			return _selected;
		}
		
		public function get groupName():String {
			return _groupName;
		}
		
		public function get currentState():String {
			return _currentState;
		}
		
		public function set currentState(value:String):void {
			if(_currentState != value) {
				_currentState = value;
				if(_skin) {
					switch(_currentState) {
						case RadioButton.SELECT_OVER:{
							_skin.selectOver();
							break;
						}
						case RadioButton.UNSELECT_OVER:{
							_skin.unSelectOver();
							break;
						}
						case RadioButton.SELECT_UP:{
							_skin.selectUp();
							break;
						}
						case RadioButton.UNSELECT_UP:{
							_skin.unSelectUp();
							break;
						}
						case RadioButton.SELECT_DOWN:{
							_skin.selectDown();
							break;
						}
						case RadioButton.UNSELECT_DOWN:{
							_skin.unSelectDown();
							break;
						}
						case RadioButton.SELECT_DISABLED:{
							_skin.selectDisabled();
							break;
						}
						case RadioButton.UNSELECT_DISABLED:{
							_skin.unSelectDisabled();
							break;
						}
					}
				}
			}
		}

		public function get vaule():Object
		{
			return _vaule;
		}

		public function set vaule(value:Object):void
		{
			_vaule = value;
		}

	}
}








