import {Connect as conn} from '../core/Connect.imba'

export tag LoginRegister
  prop username
  prop email
  prop password

  prop errors
  prop isLoading default: false

  def submit
    @isLoading = true
    @errors = null

    const actionKey = (params:path == '/register') ? 'REGISTER_USER' : 'LOGIN_USER'
    let requestBody = {
      "user": {
        "email"   : @email,
        "password": @password,
      }
    }
    
    if params:path == '/register'
      requestBody:user:username = @username
    const data = await conn.fetch actionKey, requestBody
    
    @isLoading = false

    if !data:errors
      conn.setAuth data:user
      router.go '/'
    else
      @errors = data:errors

    Imba.commit

  def render
    <self>
      <div.auth-page>
        <div.container.page>
          <div.row>

            <div.col-md-6.offset-md-3.col-xs-12>

              if params:path == '/register'
                <h1.text-xs-center> "Sign Up"
                <p.text-xs-center>
                  <a route-to="/login"> "Have an account?"
              else
                <h1.text-xs-center> "Sign In"
                <p.text-xs-center>
                  <a route-to="/register"> "Need an account?"

              if errors
                <ul.error-messages>
                  for field, value of errors
                    " " # Bug in nested loop must have a node inside
                    for message in value
                      <li> 
                        field + " " + message
                    
              <form :submit.prevent.submit>
                if params:path == '/register'
                  <fieldset.form-group>
                    <input[username].form-control.form-control-lg type="text" placeholder="Your Name">
                <fieldset.form-group>
                  <input[email].form-control.form-control-lg type="text" placeholder="Email">
                <fieldset.form-group>
                  <input[password].form-control.form-control-lg type="password" placeholder="Password">
                <button.btn.btn-lg.btn-primary.pull-xs-right .disabled=isLoading> 
                  (params:path == '/register') ? "Sign up" : "Sign in"
