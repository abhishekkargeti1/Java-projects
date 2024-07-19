<%@page import="com.project1.entities.User"%>
<%@page import="com.project1.dao.LikeandDislikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.project1.entities.Post"%>
<%@page import="com.project1.helper.ConnectionProvider"%>
<%@page import="com.project1.dao.PostDao"%>
<%@page errorPage="Error_page.jsp"%>
<style>
    .card-img-container {
        position: relative;
        width: 100%;
        height: 100px; /* Adjust this height as needed */
        overflow: hidden;
    }

    .card-img-top {
        position: absolute;
        top: 50%;
        left: 50%;
        width: auto;
        height: 100%;
        transform: translate(-50%, -50%);
    }
</style>
<div class="row">
    <%
        // Thread.sleep(2000);
        User user = (User) session.getAttribute("CurrentUser");
        PostDao postdao = new PostDao(ConnectionProvider.getConnection());
        List<Post> posts = null;
        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {
            posts = postdao.getallPost();
        } else {
            posts = postdao.getPostByCId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h4 class='display-3 text-center text-white'><b>No Post Available In This Category</b></h4>");
        }
        
        for (Post post : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <div class="card-img-container">
                <img class="card-img-top" src="Blog_Pics/<%= post.getPicture()%>" alt="Card image cap">
            </div>
            <div class="card-body text-center">
                <b><%= post.getTitle()%></b>
                <p></p>
            </div>
            <div class="card-footer bg-dark text-center">
                <%
                    LikeandDislikeDao ld = new LikeandDislikeDao(ConnectionProvider.getConnection());

                %>
                <button class="btn btn-outline-primary btn-small"><i class="fa fa-thumbs-o-up "></i> Likes <%=ld.countLikeOnPost(post.getPid())%></span></button>
                <a href="#" class="btn btn-outline-success btn-small "><i class="fa fa-commenting-o"></i><span> Comments 20</span></a>
                <a href="Show_post.jsp?post_id=<%= post.getPid()%>" class="btn btn-outline-info btn-small mt-1">Read More</a>
            </div>
        </div>
    </div>
    <%
      }
    %>
</div>
