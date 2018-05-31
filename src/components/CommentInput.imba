import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'
import {EventDispatcher as Event} from '../global/EventDispatcher.imba'

import {Form, FormErrorList} from '../layout/Form.imba'

export tag CommentInput < Form
  prop articleSlug
  prop body

  # @override Form.submit
  def submit
    return await Connect.fetch 'CREATE_COMMENT', { "comment": { "body": @body } }, {
      'slug': articleSlug
    }

  # @override Form.onSubmitSuccess
  def onSubmitSuccess result
    @body = ''
    Event.trigger 'RefreshComments'

  def render
    <self>
      if !Auth.check
        <div>
          <a route-to='/login'> "Sign in"
          " or "
          <a route-to='/register'> "Sign up"
          " to add comments on this article."
      else
        <FormErrorList[errors]>

        <form.card.comment-form>
          <div.card-block>
            <textarea.form-control[body] placeholder="Write a comment..." rows="3">
          <div.card-footer>
            <img.comment-author-img src=(avatar(Auth.session:user:image))>
            <button.btn.btn-sm.btn-primary .disabled=isLoading>
              "Post Comment"