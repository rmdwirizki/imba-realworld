export tag Header
  def render
    <self>
      <nav.navbar.navbar-light>
        <div.container>
          <a.navbar-brand route-to='/'> "conduit"
          <ul.nav.navbar-nav.pull-xs-right>
            <li.nav-item>
              # <!-- Add "active" class when you're on that page" -->
              <a.nav-link.active route-to='/'> "Home"
            <li.nav-item>
              <a.nav-link route-to='/editor'>
                <i.ion-compose>
                " New Post"
            <li.nav-item>
              <a.nav-link route-to="/settings">
                <i.ion-gear-a>
                " Settings"
            <li.nav-item>
              <a.nav-link route-to="/register"> "Sign up"