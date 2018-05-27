import {Auth} from '../request/Auth.imba'
import {Connect} from '../request/Connect.imba'
import {EventDispatcher as Event} from '../global/EventDispatcher.imba'

# Default State:
# export var FeedToggleState = {
#   tabs: [{
#     label: 'Example Tab 1',
#     isActive : do return true,
#     setFilter: do console.log 'setFilter'
#   }]
# }

export tag FeedToggle
  def isActive index
    return data:tabs[index].isActive

  def setFilter index
    data:tabs[index].setFilter 

  def render
    <self>
      <div.feed-toggle>
        <ul.nav.nav-pills.outline-active>
          for tab, index in data:tabs
            <li.nav-item>
              <a.nav-link href="" .active=(isActive(index)) :tap.prevent.setFilter(index)> 
                data:tabs[index]:label
          if data:articles:filter:tag
            <li.nav-item>
              <a.nav-link.active> 
                <i.ion-pound> 
                " " + data:articles:filter:tag