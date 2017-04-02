package com.sword.unittest.enums;

import org.junit.Test;

import static com.sword.unittest.enums.TestEnum.Type.LIST;

/**
 * Created by Joker on 2017/4/2.
 */
public class TestEnum {


    @Test
    public void testSwitch() {
        String type = "entity";
        Type type1 =   Type.valueOf(type);
        switch (type1) {
            case LIST:
                System.out.println("aaaaa");
                break;
            case ENTITY:
                System.out.println("bbbbb");
                break;
            default:
                System.out.println("hello deafault");
        }
    }


    enum Type{
        LIST,ENTITY
    }
}
