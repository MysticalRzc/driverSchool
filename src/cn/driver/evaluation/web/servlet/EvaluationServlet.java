package cn.driver.evaluation.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
import sun.font.EAttribute;*/



import cn.driver.evaluation.daomain.Evaluation;
import cn.driver.evaluation.service.EvaluationService;
import cn.driver.user.domain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class EvaluationServlet extends BaseServlet {

	private EvaluationService evaluationService=new EvaluationService();
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		User user = (User) request.getSession().getAttribute("session_user");
		Evaluation et=CommonUtils.toBean(request.getParameterMap(),Evaluation.class);
		et.setEid(CommonUtils.uuid());
		et.setUid(user.getUid());
		et.setCid("100");//只有付款时才能设置cid
		evaluationService.add(et);
		request.getSession().setAttribute("exit","exit");
		request.setAttribute("eList", evaluationService.findAll());
		return "/jsps/evaluation/list.jsp";
	}
	public String findAll(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setAttribute("eList", evaluationService.findAll());
		return "/jsps/evaluation/list.jsp";
	}

}
