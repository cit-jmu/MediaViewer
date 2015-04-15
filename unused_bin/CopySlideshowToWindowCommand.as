package org.mdid.MediaViewer.controllers
{
	import org.mdid.MediaViewer.events.WindowEvent;
	import org.mdid.MediaViewer.models.SlideshowModel;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class CopySlideshowToWindowCommand extends ModuleCommand
	{
		[Inject]
		public var event:WindowEvent;
		
		[Inject]
		public var slideshow:SlideshowModel;
		
		override public function execute():void {
			//slideshow.currentShow = event.slideshow.clone();
			//slideshow.currentPosition = event.curPosition;
			trace("huh?");//event.curPosition);
		}
	}
}