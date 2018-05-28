import {Auth} from '../request/Auth.imba'

export tag Header
  def logout
    if window.confirm "Are you sure?"
      Auth.logout
      router.go '/'

  def render
    <self>
      <nav.navbar.navbar-light>
        <div.container>
          <a.navbar-brand route-to='/'> "conduit"
          <ul.nav.navbar-nav.pull-xs-right>
            <li.nav-item>
              <a.nav-link route-to='/'> "Home"
            
            if Auth.check
              <li.nav-item>
                <a.nav-link route-to='/editor'>
                  <i.ion-compose>
                  " New Post"
              <li.nav-item>
                <a.nav-link route-to="/settings">
                  <i.ion-gear-a>
                  " Settings"

            if !Auth.check
              <li.nav-item>
                <a.nav-link route-to="/login"> "Sign in"
              <li.nav-item>
                <a.nav-link route-to="/register"> "Sign up"
            
            if Auth.check
              <li.nav-item>
                <a.nav-link route-to="/profile/@{Auth.session:user:username}">
                  <img.user-pic src=(avatar(Auth.session:user:image))
                    attr:alt=Auth.session:user:username>
                  Auth.session:user:username
              <li.nav-item>
                <a.nav-link href="" :tap.prevent.logout>
                  "Sign out"