import {Auth} from '../request/Auth.imba'

export tag Page
  prop needAuth

  def checkAuth
    return Auth.check

  def onAuthFailed
    window.alert "You don't have permission to access this page"
    router.go '/'

  def mount
    if needAuth && !self.checkAuth
      self.onAuthFailed
