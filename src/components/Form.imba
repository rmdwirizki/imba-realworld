import {Page} from '../components/Page.imba'

export tag Form < Page
  prop errors default: []
  prop isLoading default: false

  def submit
    # Must be overwritten in child's tag

  def beforeSubmit
    @isLoading = true
    @errors = []

  def afterSubmit
    @isLoading = false
    Imba.commit

  def onSubmitSuccess res
    # Must be overwritten in child's tag

  def onSubmitFail errors
    for field, value of errors
      for message in value
        @errors.push(field + " " + message)

  # Default Handler
  def onsubmit e
    e.prevent

    self.beforeSubmit
    
    const res = await self.submit
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