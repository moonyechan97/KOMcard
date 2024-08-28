package framework;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * DispatcherServlet 클래스는 들어오는 요청을 처리하고 요청 URI에 따라 적절한 컨트롤러에 포워딩하는 역할을 합니다.
 */
public class DispatcherServlet extends HttpServlet {

	private HandlerMapping mappings;

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String propLoc = config.getInitParameter("propLoc");
		
		mappings = new HandlerMapping(propLoc);
	}

	/**
	 * service 메서드는 HTTP 요청을 처리하는 메인 진입점입니다. 요청 URI를 식별하고 적절한 컨트롤러를 결정한 후, 해당 뷰로 요청을
	 * 포워딩합니다.
	 */

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청된 전체 URI를 가져옵니다.
		String uri = request.getRequestURI();
		// URI에서 컨텍스트 경로를 제거하여 상대 경로를 얻습니다.
		uri = uri.substring(request.getContextPath().length());

		// 디버깅을 위해 요청된 URI를 출력합니다.
		System.out.println("요청 URI : " + uri);

		try {
			Controller control = mappings.getController(uri);
			String callPage = control.handleRequest(request, response);

			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}