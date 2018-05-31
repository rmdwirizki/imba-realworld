import {Connect} from '../request/Connect.imba'
import {Form, FormErrorList} from '../layout/Form.imba'

export tag CreateEditArticle < Form
  prop article default: {}
  prop tagInput default: ''

  def resetForm
    @article:title = ''
    @article:description = ''
    @article:body = ''
    @article:tagList = []

    Imba.commit

  def load
    super
    self.resetForm

  def mount
    self.resetForm if !params:slug
    self.getArticle if params:slug

  def getArticle
    self.showLoading
    const result = await Connect.fetch 'GET_ARTICLE', null, { "slug": params:slug }
    const status = self.checkPageStatus result
    @article = result:article if status

    Imba.commit

  def showLoading
    @article = null
    render # manually use render if Imba.commit not working

  # @override Form.submit
  def submit
    const actionKey = (params:slug) ? 'UPDATE_ARTICLE' : 'CREATE_ARTICLE'
    let body = {
      "article": {
        "title"   : @article:title,
        "description": @article:description,
        "body": @article:body,
        "tagList": @article:tagList
      }
    }
    let reqParams = null
    reqParams = { 'slug': params:slug } if params:slug
    return await Connect.fetch actionKey, body, reqParams
  
  # @override Form.onSubmitSuccess
  def onSubmitSuccess result
    self.resetForm
    router.go '/article/' + result:article:slug

  def addTag
    if !self.validateTag
      return

    @article:tagList.push @tagInput
    # Clear tagInput, theres something wrong with
    # event order so we had to settimeout
    window.setTimeout(&, 0) do 
      @tagInput = ''
      Imba.commit

  def removeTag index
    @article:tagList.splice(index, 1)

  def validateTag
    let isValid = true
    isValid = false if @tagInput == ''

    if isValid
      for label in @article:tagList
        if @tagInput == label
          isValid = false
          break

    return isValid

  def subrender
    <self>
      if !article
        <div.editor-page>
          <div.container.page>
            <div.row>
            
              <div> "Loading..."
      else
        <div.editor-page>
          <div.container.page>
            <div.row>

              <div.col-md-10.offset-md-1.col-xs-12>
                <FormErrorList[errors]>

                <form>
                  <fieldset>
                    <fieldset.form-group>
                      <input[article:title].form-control.form-control-lg type="text" placeholder="Article Title">
                    <fieldset.form-group>
                      <input[article:description].form-control type="text" placeholder="What's this article about?">
                    <fieldset.form-group>
                      <textarea[article:body].form-control rows="8" placeholder="Write your article (in markdown)">
                    <fieldset.form-group>
                      <input[tagInput].form-control :keydown.enter.addTag type="text" placeholder="Enter tagList (Press Enter)">
                      <div.tag-list>
                        for label,index in article:tagList
                          <a.tag-pill.tag-default> 
                            <i.ion-close-round :tap.removeTag(index)>
                            " " + label
                    <button.btn.btn-lg.pull-xs-right.btn-primary :tap.onsubmit .disabled=isLoading type="button">
                      "Publish Article"