import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'

import {Form, FormErrorList} from '../layout/Form.imba'

export tag Settings < Form
  prop imageUrl
  prop name
  prop bio
  prop email
  prop password

  def resetForm
    @imageUrl = Auth.session:user:image
    @name = Auth.session:user:username
    @bio = Auth.session:user:bio
    @email = Auth.session:user:email
    @password = ''
  
  def setup
    self.resetForm

  # @override Form.submit
  def submit
    let body = {"user": {}}
    body:user:password = @password if @password != ''
    return await Connect.fetch 'UPDATE_USER', Object.assign body, {}, {
      "user": {
        "image": @imageUrl,
        "username": @name,
        "bio": @bio,
        "email": @email
      }
    }

  # @override Form.onSubmitSuccess
  def onSubmitSuccess result
    Object.assign Auth.session:user, {}, result:user
    router.go '/'
    self.resetForm

  def render
    <self>
      <div.settings-page>
        <div.container.page>
          <div.row>

            <div.col-md-6.offset-md-3.col-xs-12>
              <h1.text-xs-center> "Your Settings"

              <FormErrorList[errors]>

              <form>
                <fieldset>
                  <fieldset.form-group>
                    <input[imageUrl].form-control type="text" placeholder="URL of profile picture">
                  <fieldset.form-group>
                    <input[name].form-control.form-control-lg type="text" placeholder="Your Name">
                  <fieldset.form-group>
                    <textarea[bio].form-control.form-control-lg rows="8" placeholder="Short bio about you">
                  <fieldset.form-group>
                    <input[email].form-control.form-control-lg type="text" placeholder="Email">
                  <fieldset.form-group>
                    <input[password].form-control.form-control-lg type="password" placeholder="New Password">
                  <button.btn.btn-lg.btn-primary.pull-xs-right .disabled=isLoading>
                    "Update Settings"
