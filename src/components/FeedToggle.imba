import {Auth} from '../request/Auth.imba'

import {Connect} from '../request/Connect.imba'
import {EventDispatcher as Event} from '../global/EventDispatcher.imba'

# Default State Example:
# export var FeedToggleState = {
#   tabs: [{
#     label: 'Example Tab 1',
#     isActive : do return true,
#     setFilter: do console.log 'setFilter'
#   }]
# }

export tag FeedToggle
  prop state
  prop articleState

  def isActive index
    return state:tabs[index].isActive

  def isDisabled index
    if typeof state:tabs[index]['isDisabled'] === 'function'
      return state:tabs[index].isDisabled
    else
      return false

  def setFilter index
    if !self.isDisabled index
      state:tabs[index].setFilter

  def render
    <self>
      <div.feed-toggle>
        <ul.nav.nav-pills.outline-active>
          for tab, index in state:tabs
            <li.nav-item>
              <a.nav-link href="" .active=(isActive(index)) .disabled=(isDisabled(index)) :tap.prevent.setFilter(index)> 
                state:tabs[index]:label
          if articleState:filter:tag
            <li.nav-item>
              <a.nav-link.active> 
                <i.ion-pound> 
                " " + articleState:filter:tag