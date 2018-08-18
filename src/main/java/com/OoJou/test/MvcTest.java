package com.OoJou.test;

import java.util.List;

import javax.servlet.http.WebConnection;

import org.aspectj.lang.annotation.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.portlet.MockActionRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.OoJou.pojo.Employee;
import com.github.pagehelper.PageInfo;

/**
 * spring����ģ���ṩ�Ĳ��������ܣ�����crud����ȷ��
 * 
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"classpath*:spring/applicationContext-dao.xml",
		"classpath*:spring/applicationContext-tx.xml",
		"classpath*:spring/applicationContext-service.xml",
		"classpath*:spring/springmvc.xml"})
public class MvcTest {
	// ����Springmvc��ioc
	@Autowired
	WebApplicationContext context;

	// ����mvc���󣬻�ô�����
	MockMvc mockMvc;

	@org.junit.Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testPgae() throws Exception {
		// ��������
		MvcResult result = mockMvc.perform(
				MockMvcRequestBuilders.get("/emps").param("pn", "1"))
				.andReturn();
		// ��ȡpageinfo��֤
		MockHttpServletRequest request = result.getRequest();
		PageInfo piInfo = (PageInfo) request.getAttribute("pageinfo");
		System.out.println("��ǰҳ��" + piInfo.getPageNum());
		int[] nums = piInfo.getNavigatepageNums();
		for (int i : nums) {
			System.out.println(" " + i);
		}

		List<Employee> list = piInfo.getList();
		for (Employee employee : list) {
			System.out.println("ID:" + employee.getEmpId());
		}
	}

}
