package ex;

public class NoPostException extends ApplicationException{
    public NoPostException(String mess, Throwable exception){
        super(mess, exception);
    }
    public NoPostException(String mess){
        super(mess);
    }
}