import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'
import {Form, FormErrorList} from '../components/Form.imba'

export tag LoginRegister < Form
  prop username
  prop email
  prop password

  # @override Form.submit
  def submit
    const actionKey = (params:path == '/register') ? 'REGISTER_USER' : 'LOGIN_USER'
    let body = {
      "user": {
        "email"   : @email,
        "password": @password,
      }
    }
    body:user:username = @username if params:path == '/register'
    return await Connect.fetch actionKey, body

  # @override Form.onSubmitSuccess
  def onSubmitSuccess result
    Auth.login result:user
    router.go '/'

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

              <FormErrorList[errors]>
                    
              <form>
                if params:path == '/register'
                  <fieldset.form-group>
                    <input[username].form-control.form-control-lg type="text" placeholder="Your Name">
                <fieldset.form-group>
                  <input[email].form-control.form-control-lg type="text" placeholder="Email">
                <fieldset.form-group>
                  <input[password].form-control.form-control-lg type="password" placeholder="Password">
                <button.btn.btn-lg.btn-primary.pull-xs-right .disabled=isLoading> 
                  (params:path == '/register') ? "Sign up" : "Sign in"
