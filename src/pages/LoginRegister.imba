export tag LoginRegister
  def render
    <self>
      <div.auth-page>
        <div.container.page>
          <div.row>

            <div.col-md-6.offset-md-3.col-xs-12>
              <h1.text-xs-center> "Sign up"
              <p.text-xs-center>
                <a route-to="/login"> "Have an account?"

              <ul.error-messages>
                <li> "That email is already taken"

              <form>
                <fieldset.form-group>
                  <input.form-control.form-control-lg type="text" placeholder="Your Name">
                <fieldset.form-group>
                  <input.form-control.form-control-lg type="text" placeholder="Email">
                <fieldset.form-group>
                  <input.form-control.form-control-lg type="password" placeholder="Password">
                <button.btn.btn-lg.btn-primary.pull-xs-right> 
                  "Sign up"
                  