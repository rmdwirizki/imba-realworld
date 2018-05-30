import {Connect} from '../request/Connect.imba'
import {EventDispatcher as Event} from '../global/EventDispatcher.imba'

import {LikeButton} from './LikeButton.imba'

export class ArticleListState
  prop id
  prop filter
  prop feeds
  prop limit

  def initialize params
    this:id = params:id || Date.now
    this:filter = params:filter || { tag: null, author: null, favorited: null }
    this:feeds  = params:feeds  || false
    this:limit  = params:limit  || 20

  def setFilter feeds, filters
    this:filter = filters
    this:feeds  = feeds
    
    Event.trigger 'RefreshArticles-' + this:id

export tag ArticleList
  prop articles

  prop pageIndex  default: 1
  prop pageLength default: 1

  def setup
    Event.on 'RefreshArticles-' + data:articles:id, do |e| 
      self.setPage 1

  def mount
    self.getArticles

  def getArticles
    self.showLoading

    const action = (data:articles:feeds) ? 'FEED_ARTICLES' : 'LIST_ARTICLES';
    const result = await Connect.fetch action, { 
      "offset"   : data:articles:limit * (@pageIndex - 1), 
      "limit"    : data:articles:limit,
      "tag"      : data:articles:filter:tag,
      "author"   : data:articles:filter:author,
      "favorited": data:articles:filter:favorited
    }
    @articles = result:articles
    @pageLength = Math.ceil(result:articlesCount / data:articles:limit)

    Imba.commit

  def showLoading
    @articles = null
    Imba.commit

  def setPage page
    @pageIndex = page
    self.getArticles
  
  # Imba doesn't support looping through usual means
  # like for(let i = 0; i < pageLength; i++)
  # So we must loop though an array like [1,2,..,pageLength]
  def pagenums
    return Array(@pageLength).fill().map do |v,i| return i + 1

  def render
    <self>
      if !articles
        <div.article-preview> "Loading..."

      if articles && articles:length == 0
        <div.article-preview> "No articles are here... yet."

      for article in articles
        <div.article-preview>
          <div.article-meta>
            <a route-to="/profile/@{article:author:username}">
              <img src=(avatar(article:author:image))>
            <div.info>
              <a.author route-to="/profile/@{article:author:username}">
                article:author:username
              <span.date> article:createdAt
            <LikeButton article=article>
          <a.preview-link route-to="/article/{article:slug}">
            <h1> article:title
            <p> article:description
            <span> "Read more..."
            <ul.tag-list>
              for label,index in article:tagList
                <a.tag-pill.tag-default.tag-outline> 
                  label

      # Hide pagination when loading
      if articles
        <nav>
          <ul.pagination>
            for num in pagenums
              <li.page-item .active=(num == pageIndex)>
                <a.page-link href="" :tap.setPage(num)> 
                  num
