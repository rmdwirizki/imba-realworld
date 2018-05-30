import {Page} from '../components/Page.imba'

export tag Form < Page
  prop errors default: []
  prop isLoading default: false

  def beforeSubmit
    @isLoading = true
    @errors = []

  def onSubmit
    # Must be overwritten in child's tag

  def onSubmitSuccess res
    # Must be overwritten in child's tag

  def onSubmitFail errors
    for field, value of errors
      for message in value
        @errors.push(field + " " + message)

  def afterSubmit
    @isLoading = false
    Imba.commit

  def submit
    self.beforeSubmit
    
    const res = await self.onSubmit
    if res:errors
      self.onSubmitFail res:errors
    else
      self.onSubmitSuccess res

    self.afterSubmit

export tag FormErrorList
  def render
    <self>
      if data && data:length > 0
        <ul.error-messages>
          for message in data
            <li> 
              message