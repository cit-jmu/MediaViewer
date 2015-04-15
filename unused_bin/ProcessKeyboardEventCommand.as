package org.mdid.MediaViewer.controllers
{
	
	import org.mdid.MediaViewer.events.KeyboardUpEvent;
	import org.mdid.MediaViewer.events.NavigationEvent;
	import org.mdid.MediaViewer.models.SlideshowModel;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class ProcessKeyboardEventCommand extends ModuleCommand {
		
		[Inject]
		public var e:KeyboardUpEvent;
		
		[Inject]
		public var model:SlideshowModel;
		
		override public function execute():void {
			switch (e.keyCode) {
				//* indicates that control is available in web browser full-screen mode
				//  (other controls are disabled...this is a flash player security feature)
				case 9 : //*tab -- toggle catalog data window hide/show
				case 73 : //i
					break;
				case 72 : //h -- toggle hide images
					break;
				case 32 : //*space -- toggle scrubbar pane association
					break;
				case 38 : //*up arrow -- enlarge image
					break;
				case 40 : //*down arrow -- shrink image
					break;
				case 85 : //u -- undo split screen
					break;
				case 88 : //x -- split display horizontally (x-axis)
					break;
				case 89 : //y -- split display vertically (y-axis)
					break;
				case 35 : //end -- go to last slide
					break;
				case 36 : //home -- go to first slide
					break;
				case 37 : //*left arrow -- go to previous slide (shift + left = go to first slide? no.)
					model.navigateTo(e.targetWindow, e.targetPane, e.shiftKey ? NavigationEvent.FIRST : NavigationEvent.PREVIOUS);
					break;
				case 39 : //*right arrow -- go to next slide (shift + left = go to first last? no.)
					model.navigateTo(e.targetWindow, e.targetPane, e.shiftKey ? NavigationEvent.LAST : NavigationEvent.NEXT);
					break;
			}
		}
	}
}