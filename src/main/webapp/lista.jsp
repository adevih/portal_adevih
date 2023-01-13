<%@ page import="java.util.*"%>
<%
out.write("=============================================Session<br>");
Enumeration keys = session.getAttributeNames();
while (keys.hasMoreElements())
{
  String key = (String)keys.nextElement();
  out.println(key + ": " + session.getValue(key) + "<br>");
}
out.write("=============================================Parameters<br>");
Map<String,String[]> parameters = request.getParameterMap();
for ( String parameter : parameters.keySet() )
{
	String[] values = parameters.get(parameter);
	out.write("<br>" + parameter + ": ");
	for (int i=0; i<values.length; i++)
	{
		out.write(values[i] + ", ");
	}
}
/*
out.write("=============================================Application<br>");
keys = application.getAttributeNames();
while (keys.hasMoreElements())
{
  String key = (String)keys.nextElement();
  out.println(key + ": " + application.getAttribute(key) + "<br>");
}*/
%>