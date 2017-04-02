package com.sword.gdems.web.directive;

import com.sword.gdems.common.directive.DirectiveUtils;
import com.sword.gdems.web.response.DataTablePage;
import freemarker.core.Environment;
import freemarker.template.*;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Joker on 2017/4/2.
 */
public abstract class AbstractDirective<T> implements TemplateDirectiveModel {

    private Logger logger = LogManager.getLogger(AbstractDirective.class);

    /**
     * @param environment
     * @param map
     * @param templateModels
     * @param templateDirectiveBody
     * @throws TemplateException
     * @throws IOException
     */

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        /**
         * TYPE 参数未LIST,ENTITY,PAGE
         */
        String strType = DirectiveUtils.getString("type", map);
        if (StringUtils.isEmpty(strType)) {
            strType = "ENTITY";
        }
        Type type = Type.valueOf(strType.toUpperCase());
        logger.debug("Direct type enum: " + type);
        //需要输出的变量
        Map<String, TemplateModel> params = new HashMap<String, TemplateModel>();

        try {
            switch (type) {
                case ENTITY:
                    T entity = entity(map);
                    logger.debug("directive entity : " + entity);
                    params.put("entity", ObjectWrapper.DEFAULT_WRAPPER.wrap(entity));
                    break;
                case LIST:
                    List<T> list = list(map);
                    logger.debug("directive list : " + list);
                    params.put("list", ObjectWrapper.DEFAULT_WRAPPER.wrap(list));
                    break;
                case PAGE:
                    DataTablePage<T> page = page(map);
                    logger.debug("directive page : " + page);
                    params.put("page", ObjectWrapper.DEFAULT_WRAPPER.wrap(page));
                    break;
                case BOOLEAN:
                    boolean result = isOk(map);
                    logger.debug("directive boolean : " + result);
                    params.put("isOk", ObjectWrapper.DEFAULT_WRAPPER.wrap(result));
                    break;
                default:
                    T entity1 = entity(map);
                    logger.debug("directive entity : " + entity1);
                    params.put("entity", ObjectWrapper.DEFAULT_WRAPPER.wrap(entity1));
            }
        } catch (Exception e) {
            throw new TemplateException(e, environment);
        }

        DirectiveUtils.addParamsToVariable(environment, params);
        templateDirectiveBody.render(environment.getOut());

    }

    /**
     * 判断是否可以输出
     *
     * @param map
     * @return
     */
    protected abstract boolean isOk(Map map) throws Exception;

    /**
     * 返回分页数据
     *
     * @param map
     * @return
     * @throws Exception
     */
    protected abstract DataTablePage<T> page(Map map) throws Exception;

    /**
     * 返回列表数据
     *
     * @param map
     * @return
     * @throws Exception
     */
    protected abstract List<T> list(Map map) throws Exception;

    /**
     * 返回单个实体信息
     *
     * @param map
     * @return
     * @throws Exception
     */
    protected abstract T entity(Map map) throws Exception;

    enum Type {
        LIST, PAGE, ENTITY, BOOLEAN
    }
}
