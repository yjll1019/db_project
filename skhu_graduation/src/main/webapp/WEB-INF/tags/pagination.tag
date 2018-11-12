<%@ tag description="pagination" pageEncoding="UTF-8"%>
<%@ tag import="java.util.ArrayList" %>
<%@ attribute name="pageSize" type="java.lang.Integer" required="true" %>
<%@ attribute name="recordCount" type="java.lang.Integer" required="true" %>
<%! 
private class Page { 
    int page; 
    String label;
    
    Page(int page, String label) {
        this.page = page;
        this.label = label;
    }
} 
%>
<%
int recordCount = (Integer)jspContext.getAttribute("recordCount");
int pageSize = (Integer)jspContext.getAttribute("pageSize");

int currentPage = 1;
if (request.getParameter("pg") != null)
    currentPage = Integer.parseInt(request.getParameter("pg"));

int pageCount = recordCount / pageSize;
if (pageCount * pageSize < recordCount) ++pageCount;

String queryString = request.getQueryString();
if (queryString == null)
    queryString = "pg=@@@";
else if (queryString.matches(".*pg=[0-9]+.*"))
    queryString = queryString.replaceAll("pg=[0-9]+", "pg=@@@");
else
    queryString = queryString + "&pg=@@@";
String url = request.getAttribute("javax.servlet.forward.request_uri") + "?" + queryString;

if (currentPage > pageCount) currentPage = pageCount;
int base = ((currentPage - 1) / 10) * 10;

ArrayList<Page> pages = new ArrayList<Page>();
if (base > 0) pages.add(new Page(base, "&lt;"));
for (int i = 1; i <= 10; ++i) {
    int n = base + i;
    if (n > pageCount) break;
    pages.add(new Page(n, String.valueOf(n)));
}
int n = base + 11;
if (n <= pageCount)
    pages.add(new Page(n, "&gt;"));
%>
<ul class="pagination">
  <% for (Page p : pages) { %>
    <li class='<%= p.page == currentPage ? "active" : "" %>'>
        <a href='<%= url.replace("@@@", String.valueOf(p.page)) %>'><%= p.label %></a>
    </li>    
  <% } %>
</ul>
