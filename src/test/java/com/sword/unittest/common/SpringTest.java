package com.sword.unittest.common;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * @Author zhengzhe
 * @Date 2017/2/13
 * @Copyright:
 * @Describe:use for unit test, spring context provide
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:conf/application-context*.xml"})
public class SpringTest {
}
