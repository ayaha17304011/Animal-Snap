package util;

public class StringFilter{
    public static String htmlFilter(String s){
        String new_string = s;
        new_string = new_string.replaceAll("<","$lt;");
        new_string = new_string.replaceAll(">","$gt;");
        new_string = new_string.replaceAll("&","$amp;");
        new_string = new_string.replaceAll("\"","$quot;");

        return new_string;
    }
}