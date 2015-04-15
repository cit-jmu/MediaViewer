package org.mdid.MediaViewer.views.mediators
{
	import mx.events.CloseEvent;
	
	import org.mdid.MediaViewer.events.SlideshowCursorChangeEvent;
	import org.mdid.MediaViewer.events.SlideshowsEvent;
	import org.mdid.MediaViewer.views.components.CatalogWindow;
	import org.robotlegs.mvcs.Mediator;
	
	public class CatalogWindowMediator extends Mediator
	{
		[Inject]
		public var view:CatalogWindow;		
		
		public function CatalogWindowMediator() {
			super();
		}
		override public function onRegister():void {
			addModuleListener(SlideshowCursorChangeEvent.POSITION_CHANGED, handlePositionChangeEvent);
		}
		private function handlePositionChangeEvent(e:SlideshowCursorChangeEvent):void {
			view.title = "Slide " + e.newPosition.toString() + " of " + e.numPositions;
		}
	}
}