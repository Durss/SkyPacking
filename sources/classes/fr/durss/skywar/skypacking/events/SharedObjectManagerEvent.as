package fr.durss.skywar.skypacking.events {	import flash.events.Event;	/**	 * Event fired by the <code>SharedObjectManager</code>.	 * 	 * @author  Francois	 */	public class SharedObjectManagerEvent extends Event {				public static const TIMERS_UPDATE:String	= "updateTimers";		public static const SESSION_CHANGE:String	= "changeSessions";								/* *********** *		 * CONSTRUCTOR *		 * *********** */		/**		 * Creates an instance of <code>SharedObjectManagerEvent</code>.<br>		 */		public function SharedObjectManagerEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {			super(type, bubbles, cancelable);		}						/* ***************** *		 * GETTERS / SETTERS *		 * ***************** */		/* ****** *		 * PUBLIC *		 * ****** */		/**		 * Returns a clone of the event object.		 */		override public function clone():Event  {			return new SharedObjectManagerEvent(type, bubbles, cancelable);		}						/* ******* *		 * PRIVATE *		 * ******* */			}}