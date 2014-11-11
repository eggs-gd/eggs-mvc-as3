package gd.eggs.mvc.app {

    import starling.display.DisplayObjectContainer;


    public function applicationStartupStarling(bootstrap:IStarlingBootstrap, root:DisplayObjectContainer):void {
        bootstrap.registerModels();
        bootstrap.registerViews(root);
        bootstrap.registerControllers();

        bootstrap.startup();
    }
}
