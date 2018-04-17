package com.art.design.web.common.freemarker;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.BeansWrapperBuilder;
import freemarker.template.Configuration;
import freemarker.template.TemplateHashModel;

public class FreemarkerStaticModels extends HashMap<Object, Object> {

    private static final long serialVersionUID = 5810074548826998791L;
    private static final Logger log = LoggerFactory.getLogger(FreemarkerStaticModels.class);
    private static FreemarkerStaticModels FREEMARKER_STATIC_MODELS;
    private static Map<String, Class<?>> defaultStaticClasses = new HashMap<String, Class<?>>();

    static {
        /*
         * defaultStaticClasses.put("SystemPropertiesReader",
         * SystemPropertiesReader.class);
         * defaultStaticClasses.put("StringUtils", StringUtils.class);
         */
        defaultStaticClasses.put("System", System.class);
    }

    private FreemarkerStaticModels() {

    }

    public static FreemarkerStaticModels getInstance() {
        if (FREEMARKER_STATIC_MODELS == null) {
            FREEMARKER_STATIC_MODELS = new FreemarkerStaticModels();
            FREEMARKER_STATIC_MODELS.setDefaultStaticModel();
        }
        return FREEMARKER_STATIC_MODELS;
    }

    private void setDefaultStaticModel() {
        for (Iterator<String> iterator = defaultStaticClasses.keySet().iterator(); iterator
            .hasNext();) {
            String key = (String) iterator.next();
            FREEMARKER_STATIC_MODELS.put(key, getStaticModel(defaultStaticClasses.get(key)));
        }
    }

    public static TemplateHashModel getStaticModel(Class<?> clz) {
        try {
            BeansWrapper wrapper =
                new BeansWrapperBuilder(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS).build();
            TemplateHashModel staticModels = wrapper.getStaticModels();
            TemplateHashModel fileStatics = (TemplateHashModel) staticModels.get(clz.getName());
            return fileStatics;
        } catch (Exception ex) {
            log.error("set java static mothord enable ftl get  ", ex);
        }
        return null;
    }
}
