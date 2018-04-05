/*
 * Copyright (c) 2010-2018, b3log.org & hacpai.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.b3log.solo.processor;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.model.User;
import org.b3log.solo.AbstractTestCase;
import org.b3log.solo.model.Option;
import org.b3log.solo.service.InitService;
import org.b3log.solo.service.UserQueryService;
import org.json.JSONObject;
import static org.mockito.Mockito.*;
import org.testng.Assert;
import org.testng.annotations.Test;

/**
 * {@link LoginProcessor} test case.
 *
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @version 1.0.1.0, Feb 18, 2017
 * @since 1.7.0
 */
@Test(suiteName = "processor")
public class LoginProcessorTestCase extends AbstractTestCase {

    /**
     * Init.
     *
     * @throws Exception exception
     */
    @Test
    public void init() throws Exception {
        final InitService initService = getInitService();

        final JSONObject requestJSONObject = new JSONObject();
        requestJSONObject.put(User.USER_EMAIL, "test@gmail.com");
        requestJSONObject.put(User.USER_NAME, "Admin");
        requestJSONObject.put(User.USER_PASSWORD, "pass");

        initService.init(requestJSONObject);

        final UserQueryService userQueryService = getUserQueryService();
        Assert.assertNotNull(userQueryService.getUserByEmail("test@gmail.com"));
    }

    /**
     * showLogin.
     *
     * @throws Exception exception
     */
    @Test(dependsOnMethods = "init")
    public void showLogin() throws Exception {
        final HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getServletContext()).thenReturn(mock(ServletContext.class));
        when(request.getRequestURI()).thenReturn("/login");
        when(request.getAttribute(Keys.TEMAPLTE_DIR_NAME)).thenReturn(Option.DefaultPreference.DEFAULT_SKIN_DIR_NAME);
        when(request.getMethod()).thenReturn("GET");
        when(request.getAttribute(Keys.HttpRequest.START_TIME_MILLIS)).thenReturn(System.currentTimeMillis());

        final MockDispatcherServlet dispatcherServlet = new MockDispatcherServlet();
        dispatcherServlet.init();

        final StringWriter stringWriter = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(stringWriter);

        final HttpServletResponse response = mock(HttpServletResponse.class);
        when(response.getWriter()).thenReturn(printWriter);

        dispatcherServlet.service(request, response);

        final String content = stringWriter.toString();
        Assert.assertTrue(StringUtils.contains(content, "<title>欢迎使用 Solo!</title>"));
    }

    /**
     * login.
     *
     * @throws Exception exception
     */
    @Test(dependsOnMethods = "init")
    public void login() throws Exception {
        final HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getServletContext()).thenReturn(mock(ServletContext.class));
        when(request.getRequestURI()).thenReturn("/login");
        when(request.getMethod()).thenReturn("POST");

        final JSONObject requestJSON = new JSONObject();
        requestJSON.put(User.USER_EMAIL, "test@gmail.com");
        requestJSON.put(User.USER_PASSWORD, "pass");

        final BufferedReader reader = new BufferedReader(new StringReader(requestJSON.toString()));
        when(request.getReader()).thenReturn(reader);

        final MockDispatcherServlet dispatcherServlet = new MockDispatcherServlet();
        dispatcherServlet.init();

        final StringWriter stringWriter = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(stringWriter);

        final HttpServletResponse response = mock(HttpServletResponse.class);
        when(response.getWriter()).thenReturn(printWriter);

        dispatcherServlet.service(request, response);

        final String content = stringWriter.toString();
        Assert.assertTrue(StringUtils.contains(content, "isLoggedIn\":true"));
    }

    /**
     * logout.
     *
     * @throws Exception exception
     */
    @Test(dependsOnMethods = "init")
    public void logout() throws Exception {
        final HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getServletContext()).thenReturn(mock(ServletContext.class));
        when(request.getRequestURI()).thenReturn("/logout");
        when(request.getAttribute(Keys.TEMAPLTE_DIR_NAME)).thenReturn(Option.DefaultPreference.DEFAULT_SKIN_DIR_NAME);
        when(request.getMethod()).thenReturn("GET");
        when(request.getAttribute(Keys.HttpRequest.START_TIME_MILLIS)).thenReturn(System.currentTimeMillis());

        final MockDispatcherServlet dispatcherServlet = new MockDispatcherServlet();
        dispatcherServlet.init();

        final StringWriter stringWriter = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(stringWriter);

        final HttpServletResponse response = mock(HttpServletResponse.class);
        when(response.getWriter()).thenReturn(printWriter);

        dispatcherServlet.service(request, response);

        verify(response).sendRedirect("/");
    }

    /**
     * showForgot.
     *
     * @throws Exception exception
     */
    @Test(dependsOnMethods = "init")
    public void showForgot() throws Exception {
        final HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getServletContext()).thenReturn(mock(ServletContext.class));
        when(request.getRequestURI()).thenReturn("/forgot");
        when(request.getAttribute(Keys.TEMAPLTE_DIR_NAME)).thenReturn(Option.DefaultPreference.DEFAULT_SKIN_DIR_NAME);
        when(request.getMethod()).thenReturn("GET");
        when(request.getAttribute(Keys.HttpRequest.START_TIME_MILLIS)).thenReturn(System.currentTimeMillis());

        final MockDispatcherServlet dispatcherServlet = new MockDispatcherServlet();
        dispatcherServlet.init();

        final StringWriter stringWriter = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(stringWriter);

        final HttpServletResponse response = mock(HttpServletResponse.class);
        when(response.getWriter()).thenReturn(printWriter);

        dispatcherServlet.service(request, response);

        final String content = stringWriter.toString();
        Assert.assertTrue(StringUtils.contains(content, " <title>忘记密码 Solo!</title>"));
    }

    /**
     * forgot.
     *
     * @throws Exception exception
     */
    @Test(dependsOnMethods = "init")
    public void forgot() throws Exception {
        final HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getServletContext()).thenReturn(mock(ServletContext.class));
        when(request.getRequestURI()).thenReturn("/forgot");
        when(request.getMethod()).thenReturn("POST");

        final JSONObject requestJSON = new JSONObject();
        requestJSON.put(User.USER_EMAIL, "test@gmail.com");

        final BufferedReader reader = new BufferedReader(new StringReader(requestJSON.toString()));
        when(request.getReader()).thenReturn(reader);

        final MockDispatcherServlet dispatcherServlet = new MockDispatcherServlet();
        dispatcherServlet.init();

        final StringWriter stringWriter = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(stringWriter);

        final HttpServletResponse response = mock(HttpServletResponse.class);
        when(response.getWriter()).thenReturn(printWriter);

        dispatcherServlet.service(request, response);

        final String content = stringWriter.toString();
        Assert.assertTrue(StringUtils.contains(content, "succeed\":true"));
    }
}
