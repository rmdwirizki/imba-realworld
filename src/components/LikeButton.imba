import {Connect} from '../request/Connect.imba'
import {Auth} from '../request/Auth.imba'

export tag LikeButton
  prop withCaption default: false
  prop floating default: false

  prop article

  def favorite
    if !Auth.check
      router.go '/login'
      return;

    if @article:favorited == true
      self.unfavorite
      return;
      
    const result = await Connect.fetch 'FAVORITE_ARTICLE', null, { "slug": @article:slug }
    self.update result

  def unfavorite
    const result = await Connect.fetch 'UNFAVORITE_ARTICLE', null, { "slug": @article:slug }
    self.update result

  def update result
    @article:favorited = result:article:favorited
    @article:favoritesCount = result:article:favoritesCount
    Imba.commit

  def render
    <self .pull-xs-right=floating>
      <button.btn.btn-outline-primary.btn-sm .pull-xs-right=floating .active=article:favorited :tap.prevent.favorite>
        <i.ion-heart>
        if withCaption
          if article:favorited
            " Unfavorite Post "
          else
            " Favorite Post "
          <span.counter> "({article:favoritesCount})"
        else
          " {article:favoritesCount}"