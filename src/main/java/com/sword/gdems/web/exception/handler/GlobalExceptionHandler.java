package com.sword.gdems.web.exception.handler;


import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.exception.NotFoundException;
import com.sword.gdems.web.exception.SwordException;
import com.sword.gdems.web.response.JsonResponse;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;
import tk.mybatis.mapper.entity.Example;

/**
 * @Author zhangjian
 * @Date 2017/2/13
 * @Copyright:
 * @Describe:
 */
@ControllerAdvice
public class GlobalExceptionHandler extends Throwable{

    private static Logger logger = LogManager.getLogger(GlobalExceptionHandler.class);

    public GlobalExceptionHandler() {
        logger.debug("creste APIExceptionHandler bean.");
    }

/*

    @ExceptionHandler(SwordException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Object handleInvalidRequestError(SwordException ex) {
        return new JsonResponse(ex.getErrorCode(),ex.getMessage());
    }


    @ExceptionHandler(InvalidRequestException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    @ResponseBody
    public Object handleInvalidRequestError(InvalidRequestException ex) {
        return new JsonResponse(ex.getErrorCode(),ex.getMessage());
    }


    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    @ResponseBody
    public Object handleNoHandlerFoundException(NoHandlerFoundException ex) {
        return new JsonResponse("404",ex.getMessage());
    }

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ResponseBody
    public Object handleNotFoundException(NotFoundException ex) {
        logger.debug("Not found exception.");
        return new JsonResponse(ex.getErrorCode(),ex.getMessage());
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Object handleUnexpectedServerError(RuntimeException ex) {
        return new JsonResponse("500","internal server error : " + ex.getMessage());
    }*/



    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Object handleNotFoundException(Exception ex) {
        if (ex instanceof SwordException) {
            SwordException se = (SwordException) ex;
            return new JsonResponse(se.getErrorCode(), ex.getMessage());
        }else {
            return new JsonResponse("500","internal server error : " + ex.getMessage());
        }

    }
}
