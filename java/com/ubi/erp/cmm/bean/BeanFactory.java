package com.ubi.erp.cmm.bean;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Desc : Spring Bean을 가져오는 기능과 팩토리
 * @Author :
 * @Date :
 * @Version : 1.0
 */
public class BeanFactory implements ApplicationContextAware {

    private static ApplicationContext context;

    /**
     * Desc : ApplicationContext를 설정한다
     * @param context
     * @throws BeansException
     */
    @Override
    public void setApplicationContext( ApplicationContext context ) throws BeansException {

        BeanFactory.context = context;
    }

    /**
     * Desc : 스프링 Bean을 가져온다
     * @param sBeanName
     * @return
     */
    public static Object getBean( String sBeanName ) {
        return BeanFactory.context.getBean( sBeanName );
    }
}
