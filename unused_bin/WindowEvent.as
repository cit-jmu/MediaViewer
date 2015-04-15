package org.mdid.MediaViewer.events
{
	import flash.events.Event;
	
	import org.mdid.MediaViewer.models.vo.Slideshow;
	
	public class WindowEvent extends Event
	{
		public static const CREATE_INFO_WINDOW:String = "createInfoWindow";
		public static const COPY_SLIDESHOW_TO_SECOND_WINDOW:String = "copySlideshowToSecondWindow";
		public static const INFO_WINDOW_ADDED:String = "infoWindowAdded";
		public static const INFO_WINDOW_CLOSED:String = "infoWindowClosed";
		public static const INFO_WINDOW_REMOVED:String = "infoWindowRemoved";
		
		public var uid:String;
		public var slideshow:Slideshow;
		public var curPosition:int;
		
		public function WindowEvent(type:String, uid:String = null) {
			this.uid = uid;
			super(type, true, true);
		}
		
		override public function clone():Event
		{
			var event:WindowEvent = new WindowEvent(this.type, this.uid);
			event.slideshow = this.slideshow;
			event.curPosition = this.curPosition;
			return event;
		}
	}
}