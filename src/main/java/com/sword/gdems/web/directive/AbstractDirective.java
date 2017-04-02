package com.sword.gdems.web.directive;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.util.Map;

/**
 * Created by Joker on 2017/4/2.
 */
public abstract class AbstractDirective implements TemplateDirectiveModel {

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
     //   String ss =   DirectiveUtils.getString("a",map);
      //  templateDirectiveBody.render(environment.getOut());
    }
}
