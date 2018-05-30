import {Auth} from '../request/Auth.imba'

import {Page} from '../components/Page.imba'

import {FeedToggle} from '../components/FeedToggle.imba'
import {ArticleList, ArticleListState} from '../components/ArticleList.imba'
import {TagList} from '../components/TagList.imba'

let state = { articles: ArticleListState.new({limit: 10}) }
let toggleState = Object.assign state, {}, {
  tabs: [{
      label: 'Your Feed',
      isActive : do return !state:articles:filter:tag && state:articles:feeds,
      setFilter: do state:articles.setFilter true, {},
      needAuth : true
    },{
      label: 'Global Feed',
      isActive : do return !state:articles:filter:tag && !state:articles:feeds,
      setFilter: do state:articles.setFilter false, {}
    }
  ]
}

export tag Home < Page
  def mount
    state:articles:feeds  = Auth.check
    state:articles:filter = {}

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
              <FeedToggle[toggleState]>
              <ArticleList[state]>
            <div.col-md-3>
              <TagList[state]>