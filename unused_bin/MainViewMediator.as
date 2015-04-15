package org.mdid.MediaViewer.views.mediators
{
	import org.mdid.MediaViewer.views.components.MainView;
	import org.robotlegs.mvcs.Mediator;
	
	public class MainViewMediator extends Mediator {
		
		[Inject]
		public var view:MainView;
		
		public function MainViewMediator() {
			super();
		}

		override public function onRegister():void {
			//trace("here");
		}		
	}
}