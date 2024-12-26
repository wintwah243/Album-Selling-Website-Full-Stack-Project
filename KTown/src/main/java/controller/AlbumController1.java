package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.albumDAO;
import model.Albums;
import java.lang.NumberFormatException;

/**
 * Servlet implementation class AlbumController1
 */
@WebServlet("/AlbumController1")
public class AlbumController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
    albumDAO albumDAO = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumController1() {
    	albumDAO = new albumDAO(null);
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	if(action == null) {
    	action = "LIST";
    	}
    	switch(action) {
    	case "LIST":
    	listAlbum(request, response);
    	break;

    	case "EDIT":
    	getAlbum(request, response);
    	break;

    	case "DELETE":
    	deleteAlbum(request, response);
    	break;

    	default:
    	listAlbum(request, response);
    	break;
    	}
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */private void listAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	List<Albums> albList = albumDAO.get();
	    	request.setAttribute("albumlist", albList);
	    	dispatcher = request.getRequestDispatcher("/viewAll.jsp");
	    	dispatcher.forward(request, response);
	    }

	 private void getAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String album_id = request.getParameter("album_id");
			Albums alb = albumDAO.get(Integer.parseInt(album_id));
			request.setAttribute("album", alb);
			dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}

	    private void deleteAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	String album_id = request.getParameter("album_id");
	    	if(albumDAO.delete(Integer.parseInt(album_id))) {
	    		request.setAttribute("MSG", "Successfully Deleted");
	    	}
	    	listAlbum(request, response);
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String album_id = (request.getParameter("album_id"));
    	Albums alb = new Albums();
    	alb.setAlbum_name(request.getParameter("album_name"));
    	alb.setPrice(Double.parseDouble(request.getParameter("price")));
    	alb.setStatus(request.getParameter("status"));
    	if(album_id.isEmpty() || album_id == null) {
    		if(albumDAO.save(alb)) {
    		request.setAttribute("MSG", "Successfully Saved!");
    		}
    	}
    	else {
    		alb.setAlbum_id(Integer.parseInt(album_id));
    		if(albumDAO.update(alb)) {
    		request.setAttribute("MSG", "Successfully Updated!");
    		}
    	}
    	listAlbum(request, response);
       }
	}


