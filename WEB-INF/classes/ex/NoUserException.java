package ex;

public class NoUserException extends ApplicationException{
    public NoUserException(String mess, Throwable exception){
        super(mess, exception);
    }
    public NoUserException(String mess){
        super(mess);
    }
}