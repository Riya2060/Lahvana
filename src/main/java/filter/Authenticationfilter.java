package filter;


import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/pages/admindashboard.jsp", "/pages/customerdashboard.jsp"})
public class Authenticationfilter implements Filter {
    public void init(FilterConfig fConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("email") != null) {
            chain.doFilter(request, response); // Logged in - allow access
        } else {
            res.sendRedirect(req.getContextPath() + "/pages/login.jsp?error=loginRequired");
        }
    }

    public void destroy() {}
}



