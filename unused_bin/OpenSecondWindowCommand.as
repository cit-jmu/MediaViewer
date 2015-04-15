package org.mdid.MediaViewer.controllers
{

	import org.mdid.MediaViewer.events.WindowEvent;
	import org.mdid.MediaViewer.models.OpenWindowsProxy;
	import org.mdid.MediaViewer.models.SlideshowModel;
	import org.mdid.MediaViewer.views.components.SecondWindow;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class OpenSecondWindowCommand extends Command
	{
		[Inject]
		public var openWindowProxy:OpenWindowsProxy;
		
		[Inject]
		public var event:WindowEvent;
		
		[Inject]
		public var slideshowmodel:SlideshowModel;
		
		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;

		override public function execute():void
		{
			var window:SecondWindow;
			
			if (event.uid && openWindowProxy.hasWindowUID(event.uid)) {
				window = openWindowProxy.getWindowFromUID(event.uid);
			}
			else {
				window = openWindowProxy.createWindow();
			}
			//trace('winopening');
			window.open();
			moduleDispatcher.dispatchEvent(event);
			//trace('winopen');
			window.orderToFront();
		}
	}
}