package gd.eggs.mvc.model {
    import gd.eggs.mvc.view.IView;


    public interface IModel {
        function refresh():void;

        function addCallback(object:*, type:String, callback:Function):void
        function removeCallback(object:*, type:String = "all", callback:Function = null):void;
    }
}
