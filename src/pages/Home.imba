import {Auth} from '../request/Auth.imba'

import {Page} from '../layout/Page.imba'

import {FeedToggle} from '../components/FeedToggle.imba'
import {ArticleList, ArticleListState} from '../components/ArticleList.imba'
import {TagList} from '../components/TagList.imba'

let articleState = ArticleListState.new({limit: 10})
let toggleState  = {
  tabs: [{
      label: 'Your Feed',
      isActive  : do return !articleState:filter:tag && articleState:feeds,
      isDisabled: do return !Auth.check,
      setFilter : do articleState.setFilter true, {}
    },{
      label: 'Global Feed',
      isActive : do return !articleState:filter:tag && !articleState:feeds,
      setFilter: do articleState.setFilter false, {}
    }
  ]
}

export tag Home < Page
  def setup
    articleState:feeds  = Auth.check

  def mount
    articleState:filter = {}

  def render
    <self>
      <div.home-page>
        <div.banner>
          <div.container>
            <h1.logo-font> "conduit"
            <p> "A place to share your knowledge."
        <div.container.page>
          <div.row>
            <div.col-md-9>
              <FeedToggle state=toggleState article-state=articleState>
              <ArticleList state=articleState>
            <div.col-md-3>
              <TagList article-state=articleState>