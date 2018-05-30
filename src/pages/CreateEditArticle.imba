import {Connect} from '../request/Connect.imba'
import {Form, FormErrorList} from '../components/Form.imba'

export tag CreateEditArticle < Form
  prop title
  prop description
  prop body
  prop tags default: []

  prop tagInput default: ''

  def resetForm
    @title = ''
    @description = ''
    @body = ''
    @tags = []

  # @override Form.submit
  def submit
    return await Connect.fetch 'CREATE_ARTICLE', {
      "article": {
        "title"   : @title,
        "description": @description,
        "body": @body,
        "tagList": @tags
      }
    }
  
  # @override Form.onSubmitSuccess
  def onSubmitSuccess result
    self.resetForm
    router.go '/article/' + result:article:slug

  def addTag
    if !self.validateTag
      return

    @tags.push @tagInput
    # Clear tagInput, theres something wrong with
    # event order so we had to settimeout
    window.setTimeout(&, 0) do 
      @tagInput = ''
      Imba.commit

  def removeTag index
    @tags.splice(index, 1)

  def validateTag
    let isValid = true
    isValid = false if @tagInput == ''

    if isValid
      for label in @tags
        if @tagInput == label
          isValid = false
          break

    return isValid

  def render
    <self>
      <div.editor-page>
        <div.container.page>
          <div.row>

            <div.col-md-10.offset-md-1.col-xs-12>
              <FormErrorList[errors]>

              <form>
                <fieldset>
                  <fieldset.form-group>
                    <input[title].form-control.form-control-lg type="text" placeholder="Article Title">
                  <fieldset.form-group>
                    <input[description].form-control type="text" placeholder="What's this article about?">
                  <fieldset.form-group>
                    <textarea[body].form-control rows="8" placeholder="Write your article (in markdown)">
                  <fieldset.form-group>
                    <input[tagInput].form-control :keydown.enter.addTag type="text" placeholder="Enter tags (Press Enter)">
                    <div.tag-list>
                      for label,index in tags
                        <a.tag-pill.tag-default> 
                          <i.ion-close-round :tap.removeTag(index)>
                          " " + label
                  <button.btn.btn-lg.pull-xs-right.btn-primary :tap.onsubmit .disabled=isLoading type="button">
                    "Publish Article"