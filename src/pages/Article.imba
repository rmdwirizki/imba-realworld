import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'

import {Page} from '../layout/Page.imba'

import {ArticleMeta} from '../components/ArticleMeta.imba'
import {Markdown} from '../components/Markdown.imba'
import {CommentList} from '../components/CommentList.imba'
import {CommentInput} from '../components/CommentInput.imba'

export tag Article < Page
  prop article

  def load
    super
  
  def mount
    self.getArticle

  def getArticle
    self.showLoading
    const result = await Connect.fetch 'GET_ARTICLE', null, { "slug": params:slug }
    const status = self.checkPageStatus result
    @article = result:article if status
    
    Imba.commit

  def showLoading
    @article = null
    render # manually use render if Imba.commit not working

  def subrender
    <self>
      <div.article-page>
        if !article
          <div.banner>
            <div.container>
              <h1> "Loading..."
        else
          <div.banner>
            <div.container>
              <h1> article:title
              <ArticleMeta article=article>

          <div.container.page>
            <div.row.article-content>
              <div.col-md-12>
                <p> article:description
                <Markdown html=article:body>
                <br>
                <ul.tag-list>
                  for label,index in article:tagList
                    <a.tag-pill.tag-default.tag-outline> 
                      label
            <hr>

            <div.article-actions>
              <ArticleMeta article=article>

            <div.row>
              <div.col-xs-12.col-md-8.offset-md-2>
                <CommentInput article-slug=article:slug>
                <CommentList article-slug=article:slug>
