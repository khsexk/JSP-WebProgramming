package kpu.web.club.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

import kpu.web.club.domain.StudentVO;
import kpu.web.club.persistence.StudentDAO;

/**
 * Servlet implementation class RestServlet
 */
@WebServlet("/RestServlet")
public class RestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		String cmd = request.getParameter("cmd");
		PrintWriter out = response.getWriter();
		
		if(cmd.equals("list")) {
			StudentDAO studentDAO = new StudentDAO();
			List<StudentVO> studentlist = studentDAO.getStudentList();
			JSONArray arrayJson = new JSONArray();
			
			try {
				for(StudentVO vo : studentlist) {
					JSONObject json = new JSONObject();
					
					json.put("id", vo.getId());
					json.put("passwd", vo.getPasswd());
					json.put("username", vo.getUsername());
					json.put("snum", vo.getSnum());
					json.put("depart", vo.getDepart());
					json.put("mobile", vo.getMobile());
					json.put("email", vo.getEmail());
					
					arrayJson.put(json);
				}
			} catch(JSONException e) {
				e.printStackTrace();
			}
			out.println(arrayJson);
		}
		else if(cmd.equals("read")) {
			String id = request.getParameter("id");
			StudentDAO studentDAO = new StudentDAO();
			StudentVO vo = studentDAO.read(id);
			JSONArray arrayJson = new JSONArray();
			
			try {
					JSONObject json = new JSONObject();
					json.put("id", vo.getId());
					json.put("passwd", vo.getPasswd());
					json.put("username", vo.getUsername());
					json.put("snum", vo.getSnum());
					json.put("depart", vo.getDepart());
					json.put("mobile", vo.getMobile());
					json.put("email", vo.getEmail());
					arrayJson.put(json);

			} catch(JSONException e) {
				e.printStackTrace();
			}
			out.println(arrayJson);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
