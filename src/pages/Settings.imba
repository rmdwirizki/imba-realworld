export tag Settings
  def render
    <self>
      <div.settings-page>
        <div.container.page>
          <div.row>

            <div.col-md-6.offset-md-3.col-xs-12>
              <h1.text-xs-center> "Your Settings"

              <form>
                <fieldset>
                  <fieldset.form-group>
                    <input.form-control type="text" placeholder="URL of profile picture">
                  <fieldset.form-group>
                    <input.form-control.form-control-lg type="text" placeholder="Your Name">
                  <fieldset.form-group>
                    <textarea.form-control.form-control-lg rows="8" placeholder="Short bio about you">
                  <fieldset.form-group>
                    <input.form-control.form-control-lg type="text" placeholder="Email">
                  <fieldset.form-group>
                    <input.form-control.form-control-lg type="password" placeholder="Password">
                  <button.btn.btn-lg.btn-primary.pull-xs-right>
                    "Update Settings"
