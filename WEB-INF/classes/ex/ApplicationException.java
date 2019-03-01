package ex;

public class ApplicationException extends Exception{
    public ApplicationException(String mess, Throwable exception){
        super(mess, exception);
    }
    public ApplicationException(String mess){
        super(mess);
    }
}