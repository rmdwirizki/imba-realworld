import {Connect} from '../request/Connect.imba'
import {Auth} from '../request/Auth.imba'

export tag FollowButton
  prop user

  def follow
    if @user:following == true
      self.unfollow
      return;
      
    const result = await Connect.fetch 'FOLLOW_USER', null, { "username": @user:username }
    self.update result

  def unfollow
    const result = await Connect.fetch 'UNFOLLOW_USER', null, { "username": @user:username }
    self.update result

  def update result
    @user:following = result:profile:following
    Imba.commit

  def render
    <self>
      if Auth.check && Auth.session:user:username != user:username
        if user:following
          <button.btn.btn-sm.btn-secondary.action-btn :tap.prevent.follow>
            <i.ion-minus-round>
            " Unfollow {user:username}"
        else
          <button.btn.btn-sm.btn-outline-secondary.action-btn :tap.prevent.follow>
            <i.ion-plus-round>
            " Follow {user:username}"