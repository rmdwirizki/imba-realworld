import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'
import {EventDispatcher as Event} from '../global/EventDispatcher.imba'

import {LikeButton} from '../components/LikeButton.imba'
import {FollowButton} from '../components/FollowButton.imba'

export tag ArticleMeta
  prop article
  
  def deleteArticle
    if window.confirm "Are you sure?"
      const result = await Connect.fetch 'DELETE_ARTICLE', null, {
        "slug": article:slug
      }
      Event.trigger 'RefreshArticles-Profile'
      router.go '/profile/@' + article:author:username

  def render
    <self>
      <div.article-meta>
        <a route-to="/profile/@{article:author:username}">
          <img src=(avatar(article:author:image))>
        <div.info>
          <a.author route-to="/profile/@{article:author:username}"> 
            article:author:username
          <span.date> timestamp(article:createdAt)
        if Auth.check && Auth.session:user:username == article:author:username
          <button.btn.btn-sm.btn-outline-warning.m-right route-to="/editor/{article:slug}">
            <i.ion-edit>
            " Edit Article" 
          <button.btn.btn-sm.btn-outline-danger :tap.deleteArticle>
            <i.ion-trash-a>
            " Delete Article" 
        else
          <FollowButton.inline-block.m-right user=article:author>
          <LikeButton.inline-block article=article with-caption=true>