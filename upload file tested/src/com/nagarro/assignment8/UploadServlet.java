package com.nagarro.assignment8;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String uploadPath = "//home//chirag//Documents//uploaded";
	private static final int maxMemorySize = 1024 * 1024 * 3;  
	private static final int maxFileSize = 1024 * 1024 * 40; 
	private static final int maxRequestSize = 1024 * 1024 * 50;

	private boolean isMultipart = false;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart) {

			response.setContentType("text/html");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(maxMemorySize);
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(maxFileSize);
			upload.setSizeMax(maxRequestSize);

			File uploadDirectory = new File(uploadPath);
			if(!uploadDirectory.exists()) {
				uploadDirectory.mkdir();
			}

			List<FileItem> fileItems=null;

			try {
				fileItems = upload.parseRequest(request);
				Iterator<FileItem> it = fileItems.iterator();

				while (it.hasNext()) {	
					FileItem item = it.next();

					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						item.write(storeFile);
					}
				}
				
				request.setAttribute("files", new File(uploadPath).listFiles());
				request.getRequestDispatcher("/Files.jsp").forward(request,response);
				
			} catch (FileUploadException e) {
				request.setAttribute("errorMessage", e);
				request.getRequestDispatcher("/Upload.jsp").forward(request,response);
			} catch (Exception e) {
				request.setAttribute("errorMessage", e);
				request.getRequestDispatcher("/Upload.jsp").forward(request,response);
			}
		}
		else {
			request.setAttribute("errorMessage", "Content type is not multipart/form-data");
			request.getRequestDispatcher("/Upload.jsp").forward(request,response);
		}
	}
}