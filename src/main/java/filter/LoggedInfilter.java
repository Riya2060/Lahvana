package filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/pages/login.jsp", "/pages/register.jsp"})
public class LoggedInfilter implements Filter {
    public void init(FilterConfig fConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("email") != null) {
            // Redirect based on role
            String role = (String) session.getAttribute("role");
            if ("admin".equalsIgnoreCase(role)) {
                res.sendRedirect(req.getContextPath() + "/pages/admindashboard.jsp");
            } else {
                res.sendRedirect(req.getContextPath() + "/pages/customerdashboard.jsp");
            }
        } else {
            chain.doFilter(request, response); // Not logged in - allow access
        }
    }

    public void destroy() {}
}
