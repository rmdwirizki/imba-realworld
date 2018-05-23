import {Connect as conn} from '../core/Connect.imba'

export tag Home
  prop articles
  prop tags

  prop tagFilter

  prop pageLimit  default: 20
  prop pageIndex  default: 1
  prop pageLength default: 1

  def mount
    self.getArticles
    self.getTags

  def getArticles
    const data = await conn.fetch 'LIST_ARTICLES', { 
      "offset": @pageLimit * (@pageIndex - 1), 
      "limit" : @pageLimit,
      "tag"   : @tagFilter 
    }
    @articles = data:articles
    @pageLength = Math.ceil(data:articlesCount / @pageLimit)

    Imba.commit

  def getTags
    const data = await conn.fetch 'LIST_TAGS'
    @tags = data:tags

    Imba.commit

  def setPage page
    @pageIndex = page
    @articles  = null

    self.getArticles

  def setTag label
    @tagFilter = label

    self.setPage 1
  
  def clearFilter
    @tagFilter = null
    
    self.setPage 1

  # Imba doesn't support looping through usual means
  # like for(let i = 0; i < pageLength; i++)
  # So we must loop though an array like [1,2,..,pageLength]
  def pagenums
    return Array(@pageLength).fill().map do |v,i| return i + 1

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
              <div.feed-toggle>
                <ul.nav.nav-pills.outline-active>
                  <li.nav-item>
                    <a.nav-link.disabled> "Your Feed"
                  <li.nav-item>
                    <a.nav-link href="" .active=!tagFilter :tap.clearFilter> 
                      "Global Feed"
                  if tagFilter
                    <li.nav-item>
                      <a.nav-link.active> 
                        <i.ion-pound> 
                        " " + tagFilter

              if !articles
                <div.article-preview> "Loading..."

              if articles && articles:length == 0
                <div.article-preview> "No articles are here... yet."

              for article in articles
                <div.article-preview>
                  <div.article-meta>
                    <a route-to=('/profile/@' + article:author:username)>
                      <img src=article:author:image>
                    <div.info>
                      <a.author route-to=('/profile/@' + article:author:username)> 
                        article:author:username
                      <span.date> article:createdAt
                    <button.btn.btn-outline-primary.btn-sm.pull-xs-right>
                      <i.ion-heart>
                      " " + article:favoritesCount
                  <a.preview-link route-to=('/article/' + article:slug)>
                    <h1> article:title
                    <p> article:description
                    <span> "Read more..."

              <nav>
                <ul.pagination>
                  for num in pagenums
                    <li.page-item .active=(num == pageIndex)>
                      <a.page-link href="" :tap.setPage(num)> 
                        num

            <div.col-md-3>
              <div.sidebar>
                <p> "Popular Tags"

                if !tags
                  <div.tag-list> "Loading..."

                <div.tag-list>
                  for label in tags
                    <a.tag-pill.tag-default href="" :tap.setTag(label)> 
                      label