import {Auth} from '../request/Auth.imba'

export tag Page
  prop needAuth
  prop pageNotFound default: false

  def checkAuth
    return Auth.check

  def onAuthFailed
    window.alert "You don't have permission to access this page"
    router.go '/'

  def load
    @pageNotFound = false

  def mount
    @pageNotFound = false
    self.onAuthFailed if needAuth && !self.checkAuth

  def checkPageStatus result
    @pageNotFound = true if result:status == 404
    return result:status != 404
    
  def render
    if pageNotFound
      <self>
        <div.flex.self-centered>
          <h1> "Error Loading Page"
          <p> "Page not found"
    else
      self.subrender

  def subrender
    # To be overwritten in child's tag element
