package gd.eggs.mvc.view {
    import gd.eggs.mvc.model.IModel;


    public interface IView {
        function hide():void;
        function show():void;

        function setModel(model:IModel, update:Boolean = true):void
    }
}
