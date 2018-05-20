export tag Home
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
                    <a.nav-link.disabled route-to='/#my-feeds'> "Your Feed"
                  <li.nav-item>
                    <a.nav-link.active route-to='/#global-feeds'> "Global Feed"

              <div.article-preview>
                <div.article-meta>
                  <a route-to='/profile/@someone'>
                    <img src="http://i.imgur.com/Qr71crq.jpg">
                  <div.info>
                    <a.author route-to="/profile/@someone"> "Eric Simons"
                    <span.date> "January 20th"
                  <button.btn.btn-outline-primary.btn-sm.pull-xs-right>
                    <i.ion-heart>
                    " 29"
                <a.preview-link route-to="/article/lorem-ipsum">
                  <h1> "How to build webapps that scale"
                  <p> "This is the description for the post."
                  <span> "Read more..."

              <div.article-preview>
                <div.article-meta>
                  <a route-to='/profile/@someone'>
                    <img src="http://i.imgur.com/N4VcUeJ.jpg">
                  <div.info>
                    <a.author route-to="/profile/@someone"> "Albert Pai"
                    <span.date> "January 20th"
                  <button.btn.btn-outline-primary.btn-sm.pull-xs-right>
                    <i.ion-heart>
                    " 32"
                <a.preview-link route-to="/article/lorem-ipsum">
                  <h1> "The song you won't ever stop singing. No matter how hard you try."
                  <p> "This is the description for the post."
                  <span> "Read more..."

            <div.col-md-3>
              <div.sidebar>
                <p> "Popular Tags"

                <div.tag-list>
                  <a.tag-pill.tag-default route-to="/#sometag"> "programming"
                  <a.tag-pill.tag-default route-to="/#sometag"> "javascript"
                  <a.tag-pill.tag-default route-to="/#sometag"> "emberjs"
                  <a.tag-pill.tag-default route-to="/#sometag"> "angularjs"
                  <a.tag-pill.tag-default route-to="/#sometag"> "react"
                  <a.tag-pill.tag-default route-to="/#sometag"> "mean"
                  <a.tag-pill.tag-default route-to="/#sometag"> "node"
                  <a.tag-pill.tag-default route-to="/#sometag"> "rails"