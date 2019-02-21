package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

public class ToCurrentPageFilter implements Filter {
    public void init(FilterConfig fConfig) throws ServletException{}

    public void destroy(){}

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
    throws IOException, ServletException{
        HttpServletRequest hreq = (HttpServletRequest)req;
        HttpServletResponse hres = (HttpServletResponse)res;
        String servletPath = (String)hreq.getAttribute("target");
        System.out.println("dofilter TCP");
        System.out.println(servletPath);
        System.out.println((String)hreq.getAttribute("target"));
        if(servletPath!=null){
            System.out.println("tcp jump");
            hreq.getRequestDispatcher(servletPath).forward(hreq, hres);
        }
        else{
            chain.doFilter(hreq, hres);
        }
    }
}