export tag Article
  def render
    <self>
      <div.article-page>

        <div.banner>
          <div.container>

            <h1> "How to build webapps that scale"

            <div.article-meta>
              <a route-to="/profile/@someone">
                <img src="http://i.imgur.com/Qr71crq.jpg">
              <div.info>
                <a.author route-to="/profile/@someone"> "Eric Simons"
                <span.date> "January 20th"
              <button.btn.btn-sm.btn-outline-secondary>
                <i.ion-plus-round>
                " Follow Eric Simons" 
                <span.counter> "(10)  "
              <button.btn.btn-sm.btn-outline-primary>
                <i.ion-heart>
                " Favorite Post" 
                <span.counter> "(29)"

        <div.container.page>

          <div.row.article-content>
            <div.col-md-12>
              <p> "Web development technologies have evolved at an incredible clip over the past few years."
              <h2 id="introducing-ionic"> "Introducing RealWorld."
              <p> "It's a great solution for learning how other frameworks work."

          <hr>

          <div.article-actions>
            <div.article-meta>
              <a route-to="/profile/@someone">
                <img src="http://i.imgur.com/Qr71crq.jpg">
              <div.info>
                <a.author route-to="/profile/@someone"> "Eric Simons"
                <span.date> "January 20th"

              <button.btn.btn-sm.btn-outline-secondary>
                <i.ion-plus-round>
                " Follow Eric Simons" 
                <span.counter> "(10) "
              <button.btn.btn-sm.btn-outline-primary>
                <i.ion-heart>
                " Favorite Post" 
                <span.counter> "(29)"

          <div.row>

            <div.col-xs-12.col-md-8.offset-md-2>

              <form.card.comment-form>
                <div.card-block>
                  <textarea.form-control placeholder="Write a comment..." rows="3">
                <div.card-footer>
                  <img.comment-author-img src="http://i.imgur.com/Qr71crq.jpg">
                  <button.btn.btn-sm.btn-primary>
                    "Post Comment"
              
              <div.card>
                <div.card-block>
                  <p.card-text> "With supporting text below as a natural lead-in to additional content."
                <div.card-footer>
                  <a.comment-author route-to="/profile/@someone">
                    <img.comment-author-img src="http://i.imgur.com/Qr71crq.jpg">
                  " "
                  <a.comment-author route-to="/profile/@someone"> "Jacob Schmidt"
                  <span.date-posted> "Dec 29th"

              <div.card>
                <div.card-block>
                  <p.card-text> "With supporting text below as a natural lead-in to additional content."
                <div.card-footer>
                  <a.comment-author route-to="/profile/@someone">
                    <img.comment-author-img src="http://i.imgur.com/Qr71crq.jpg">
                  " "
                  <a.comment-author route-to="/profile/@someone"> "Jacob Schmidt"
                  <span.date-posted> "Dec 29th"
                  <span.mod-options>
                    <i.ion-edit>
                    <i.ion-trash-a>