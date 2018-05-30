import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'

import {Page} from '../components/Page.imba'

import {FeedToggle} from '../components/FeedToggle.imba'
import {ArticleList, ArticleListState} from '../components/ArticleList.imba'
import {TagList} from '../components/TagList.imba'

let tempUsername

let state = { articles: ArticleListState.new({limit: 5}) }
let toggleState = Object.assign state, {}, {
  tabs: [{
      label: 'My Articles',
      isActive : do return state:articles:filter:author,
      setFilter: do state:articles.setFilter false, { author: tempUsername }
    },{
      label: 'Favorited Articles',
      isActive : do return state:articles:filter:favorited,
      setFilter: do state:articles.setFilter false, { favorited: tempUsername }
    }
  ]
}

export tag Profile < Page
  prop userProfile

  def load
    tempUsername = window.decodeURIComponent params:username.substr(1)
    state:articles.setFilter false, { author: tempUsername }

    self.getProfile
  
  def getProfile
    self.showLoading

    const result = await Connect.fetch 'GET_PROFILE', null, { "username": tempUsername }
    @userProfile = result:profile

    Imba.commit

  def showLoading
    @userProfile = null
    render # manually use render if Imba.commit not working

  def render
    <self>
      <div.profile-page>

        if !userProfile
          <div.user-info>
            <div.container>
              <div.row> 
                <div.col-xs-12.col-md-10.offset-md-1>
                  "Loading..."
                  <br>
                  <br>
        else
          <div.user-info>
            <div.container>
              <div.row>

                <div.col-xs-12.col-md-10.offset-md-1>
                  <img.user-img src=(avatar(userProfile:image))>
                  <h4> userProfile:username
                  <p>
                    userProfile:bio

                  if Auth.check && Auth.session:user:username != userProfile:username
                    if userProfile:following
                      <button.btn.btn-sm.btn-secondary.action-btn>
                        <i.ion-minus-round>
                        " Unfollow {userProfile:username}"
                    else
                      <button.btn.btn-sm.btn-outline-secondary.action-btn>
                        <i.ion-plus-round>
                        " Follow {userProfile:username}"

        <div.container>
          <div.row>
            <div.col-xs-12.col-md-10.offset-md-1>
              <FeedToggle[toggleState]>
              <ArticleList[state]>
