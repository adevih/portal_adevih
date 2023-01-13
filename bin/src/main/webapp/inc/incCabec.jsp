<%@ page import="javax.naming.*,java.math.*,java.sql.*,java.util.*,javax.sql.DataSource,com.infinity.cad.*,com.flexnet.utl.*"%><%!
	public void Close(Connection conn)
	{
		if ( conn != null )
		{
			try
			{
				conn.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace(System.out);
			}
		}
	}
	public String getIpAddr(HttpServletRequest request)
	{
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getRemoteAddr();
		}
		return ip;
	}
%><%
    
        UTLConnection conn                                          =	new UTLConnection();
        String url 							= 	System.getenv("URL");
        String user 						= 	System.getenv("USER");
        String pass 						= 	System.getenv("PASS");
        String dir_base                                         =       System.getenv("CLOUDCUBE_URL");
//        String dir_base						= 	"C:/Users/J. Victor/Documents/Elysium Projects/Portal_Elysium/back_elysium/src/main/webapp/config";
        
	try { Class.forName("com.mysql.jdbc.Driver"); }
	catch (ClassNotFoundException e) { out.write("Getting class: " + e); }
  	try
	{ 
                conn.setConnection( DriverManager.getConnection("jdbc:mysql://kyxpl8.stackhero-network.com:3306/portal_dev?noAccessToProcedureBodies=true", "portal_admin", "@!nfinity#22"));
		conn.setDominio("INF");
		conn.setIp(getIpAddr(request));
		conn.setGuid(request.getParameter("txtUid"));
	}
	catch (java.sql.SQLException se) { out.write("Getting connection: " + se); }
%>