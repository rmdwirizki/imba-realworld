export tag Profile
  def render
    <self>
      <div.profile-page>

        <div.user-info>
          <div.container>
            <div.row>

              <div.col-xs-12.col-md-10.offset-md-1>
                <img.user-img src="http://i.imgur.com/Qr71crq.jpg">
                <h4> "Eric Simons"
                <p>
                  "Cofounder @GoThinkster, lived in Aol's HQ for a few months, kinda looks like Peeta from the Hunger Games"
                <button.btn.btn-sm.btn-outline-secondary.action-btn>
                  <i.ion-plus-round>
                  " Follow Eric Simons" 

        <div.container>
          <div.row>

            <div.col-xs-12.col-md-10.offset-md-1>
              <div.articles-toggle>
                <ul.nav.nav-pills.outline-active>
                  <li.nav-item>
                    <a.nav-link.active route-to="/profile/@someone"> "My Articles"
                  <li.nav-item>
                    <a.nav-link route-to="/profile/@someone/favorites"> "Favorited Articles"

              <div.article-preview>
                <div.article-meta>
                  <a route-to="/profile/@someone">
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
                  <a route-to="/profile/@someone">
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
                  <ul.tag-list>
                    <li.tag-default.tag-pill.tag-outline> "Music"
                    <li.tag-default.tag-pill.tag-outline> "Song"
