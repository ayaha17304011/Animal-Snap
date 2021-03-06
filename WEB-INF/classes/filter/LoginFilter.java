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

public class LoginFilter implements Filter {
    public void init(FilterConfig fConfig) throws ServletException{}

    public void destroy(){}

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
    throws IOException, ServletException{
        HttpServletRequest hreq = (HttpServletRequest)req;
        HttpServletResponse hres = (HttpServletResponse)res;
        HttpSession session = hreq.getSession(false);
        System.out.println("do filter loginC");
        boolean loggedin = false;
        
        if(session != null){
            loggedin = session.getAttribute("userId") != null;
        }
        
        if(loggedin){
            chain.doFilter(hreq, hres);
        }else{
            String servletPath = hreq.getServletPath();
            System.out.println(servletPath);            
            hreq.setAttribute("target",servletPath);
            System.out.println((String)hreq.getAttribute("target"));
            hreq.getRequestDispatcher("/log").forward(hreq, hres);
        }
    }
}
