<!DOCTYPE html>
<html>
  <head>
    <title>管理系统 | 登录</title>
    [#include "common/common-meta.ftl"/]
    [#include "common/common-css.ftl"/]
    <link rel="stylesheet" href="${path!}/static/resources/css/login.css" >
  </head>
  <body class="hold-transition">
    <div class="login-box">
      <div class="login-logo">
          <i class="icon-spinner icon-spin"></i>
        <a href="#"><b></b>&nbsp;管理系统</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">登录</p>
          <div class="callout callout-danger hide" id="tip">
              <h4>提示!</h4>
              <p>用户名或者密码不正确。</p>
          </div>
        <form action="${path}/login" method="post" id="login-form">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="用户名" name="username" id="username">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="密码" name="password" id="password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox" name="remember" id="remember"> 记住我
                </label>
              </div>
            </div><!-- /.col -->
            <div class="col-xs-4">
              <input type="submit" class="btn btn-primary btn-block btn-flat" value="登录"/>
            </div><!-- /.col -->
          </div>
        </form>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    [#include "common/common-js.ftl"/]
    <script type="text/javascript" src="${path}/static/resources/js/login.js"></script>
  </body>
</html>
