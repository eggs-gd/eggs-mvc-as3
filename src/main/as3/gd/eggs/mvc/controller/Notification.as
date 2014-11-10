package gd.eggs.mvc.controller
{
	import flash.events.Event;


	public class Notification extends Event
	{
		public static const UPDATE:String = "notificationUpdate";

		private var _data:Object;
		private var _sender:Controller;

		public function Notification(type:String, data:Object, sender:Controller = null)
		{
			_sender = sender;
			_data = data;

			super(type, false, false);
		}

		public override function clone():Event
		{
			return new Notification(type, data, sender);
		}

		public override function toString():String
		{
			return formatToString("Notification", "type", "data", "bubbles", "cancelable", "eventPhase");
		}

		public function get data():Object { return _data; }

		public function get sender():Controller { return _sender; }
		public function set sender(value:Controller):void { _sender = value; }
	}
}
