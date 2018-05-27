import {FeedToggle} from '../components/FeedToggle.imba'
import {ArticleList, ArticleListState} from '../components/ArticleList.imba'
import {TagList} from '../components/TagList.imba'

let state = { articles: ArticleListState.new('home') }
let toggleState = Object.assign state, {}, {
  tabs: [{
      label: 'Your Feed',
      isActive : do return !state:articles:filter:tag && state:articles:feeds,
      setFilter: do state:articles.setFilter true, {}
    },{
      label: 'Global Feed',
      isActive : do return !state:articles:filter:tag && !state:articles:feeds,
      setFilter: do state:articles.setFilter false, {}
    }
  ]
}

export tag Home
  def mount
    state:articles.setFilter false, {}

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