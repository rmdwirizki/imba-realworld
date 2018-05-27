import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'

import {FeedToggle} from '../components/FeedToggle.imba'
import {ArticleList, ArticleListState} from '../components/ArticleList.imba'
import {TagList} from '../components/TagList.imba'

let tempUsername

let state = { articles: ArticleListState.new('profile') }
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

export tag Profile
  prop profile

  def load
    self.getProfile
    state:articles.setFilter false, { author: params:username.substr(1) }
  
  def getProfile
    const data = await Connect.fetch 'GET_PROFILE', null, { 
      # Remove @
      "username": params:username.substr(1) 
    }
    @profile = data:profile
    tempUsername = data:profile:username

    Imba.commit

  def render
    <self>
      <div.profile-page>

        if !profile
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
                  <img.user-img src=profile:image>
                  <h4> profile:username
                  <p>
                    profile:bio

                  if Auth.check && Auth.session:user:username != profile:username
                    if profile:following
                      <button.btn.btn-sm.btn-secondary.action-btn>
                        <i.ion-minus-round>
                        " Unfollow {profile:username}"
                    else
                      <button.btn.btn-sm.btn-outline-secondary.action-btn>
                        <i.ion-plus-round>
                        " Follow {profile:username}"

          <div.container>
            <div.row>
              <div.col-xs-12.col-md-10.offset-md-1>
                <FeedToggle[toggleState]>
                <ArticleList[state]>
