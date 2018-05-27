import {Connect} from '../request/Connect.imba'
import {EventDispatcher as Event} from '../global/EventDispatcher.imba'

export tag TagList
  prop tags

  def mount
    self.getTags

  def getTags
    const data = await Connect.fetch 'LIST_TAGS'
    @tags = data:tags

    Imba.commit

  def setTag label
    data:articles.setFilter false, { tag: label }
  
  def render
    <self>
      <div.sidebar>
        <p> "Popular Tags"

        if !tags
          <div.tag-list> "Loading..."

        <div.tag-list>
          for label in tags
            <a.tag-pill.tag-default href="" :tap.prevent.setTag(label)> 
              label
