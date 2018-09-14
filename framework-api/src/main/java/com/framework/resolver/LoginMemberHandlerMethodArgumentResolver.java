package com.framework.resolver;

import com.framework.annotation.LoginUser;
import com.framework.interceptor.AuthorizationInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * 有@LoginUser注解的方法参数，注入当前登录用户
 */
@Component
public class LoginMemberHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {
//    @Autowired
//    private PlMemberService plMemberService;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
//        return parameter.getParameterType().isAssignableFrom(PlMemberEntity.class) && parameter.hasParameterAnnotation(LoginUser.class);
        return true;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer container, NativeWebRequest request, WebDataBinderFactory factory) throws Exception {
        // 获取用户ID
        Object object = request.getAttribute(AuthorizationInterceptor.USER_KEY, RequestAttributes.SCOPE_REQUEST);
        if (object == null) {
            return null;
        }

        // 获取用户信息
        //PlMemberEntity plMemberEntity = plMemberService.selectById((Long) object);

        //return plMemberEntity;
        return "";
    }
}
