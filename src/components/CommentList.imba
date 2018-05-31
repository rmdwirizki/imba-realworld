import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'
import {EventDispatcher as Event} from '../global/EventDispatcher.imba'

export tag CommentList
  prop articleSlug
  prop comments

  def setup
    Event.on 'RefreshComments', do |e| 
      self.getComments

  def mount
    self.showLoading
    self.getComments

  def getComments
    const result = await Connect.fetch 'GET_COMMENTS', null, { "slug": articleSlug }
    @comments = result:comments

    Imba.commit

  def showLoading
    @comments = null
    render # manually use render if Imba.commit not working

  def deleteComment commentId
    if window.confirm "Are you sure?"
      const result = await Connect.fetch 'DELETE_COMMENT', null, {
        "slug": articleSlug,
        "id": commentId
      }
      Event.trigger 'RefreshComments'

  def render
    <self>
      if !comments
        <br>
        <div.text-sm-center.text-muted> "Loading..."
      
      if comments && comments:length == 0
        <br>
        <div.text-sm-center.text-muted> "No comments are here... yet."

      for comment in comments
        <div.card>
          <div.card-block>
            <p.card-text> comment:body
          <div.card-footer>
            <a.comment-author route-to="/profile/@{comment:author:username}">
              <img.comment-author-img src=(avatar(comment:author:image))>
            " "
            <a.comment-author route-to="/profile/@{comment:author:username}"> 
              comment:author:username
            <span.date-posted> timestamp(comment:createdAt)
            if Auth.check && Auth.session:user:username == comment:author:username
              <span.mod-options :tap.deleteComment(comment:id)>
                <i.ion-trash-a>