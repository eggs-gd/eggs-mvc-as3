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
