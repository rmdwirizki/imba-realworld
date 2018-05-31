import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'

import {Page} from '../layout/Page.imba'

import {FollowButton} from '../components/FollowButton.imba'
import {FeedToggle} from '../components/FeedToggle.imba'
import {ArticleList, ArticleListState} from '../components/ArticleList.imba'

let tempUsername

let articleState = ArticleListState.new({limit: 5})
let toggleState  = {
  tabs: [{
      label: 'My Articles',
      isActive : do return articleState:filter:author,
      setFilter: do articleState.setFilter false, { author: tempUsername }
    },{
      label: 'Favorited Articles',
      isActive : do return articleState:filter:favorited,
      setFilter: do articleState.setFilter false, { favorited: tempUsername }
    }
  ]
}

export tag Profile < Page
  prop userProfile

  def load
    tempUsername = window.decodeURIComponent params:username.substr(1)
    articleState.setFilter false, { author: tempUsername }

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

                  <FollowButton user=userProfile>

        <div.container>
          <div.row>
            <div.col-xs-12.col-md-10.offset-md-1>
              <FeedToggle state=toggleState article-state=articleState>
              <ArticleList state=articleState>
