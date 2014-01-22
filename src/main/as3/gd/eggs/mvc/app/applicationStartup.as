/**
 * Created with IntelliJ IDEA.
 * User: oburdun
 * Date: 12/24/13
 * Time: 8:04 PM
 * To change this template use File | Settings | File Templates.
 */
package gd.eggs.mvc.app
{
	import flash.display.DisplayObjectContainer;


	public function applicationStartup(bootstrap:IBootstrap, root:DisplayObjectContainer):void
	{

		bootstrap.registerModels();
		bootstrap.registerViews(root);
		bootstrap.registerControllers();

		bootstrap.startup();
	}
}
