[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex fabcd50..f14be09 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -5,51 +5,34 @@[m [mgit_source(:github) do |repo_name|[m
   "https://github.com/#{repo_name}.git"[m
 end[m
 [m
[31m-[m
[31m-# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'[m
 gem 'rails', '~> 5.1.6'[m
[31m-# Use mysql as the database for Active Record[m
 gem 'mysql2', '>= 0.3.18', '< 0.6.0'[m
[31m-# Use Puma as the app server[m
 gem 'puma', '~> 3.7'[m
[31m-# Use SCSS for stylesheets[m
 gem 'sass-rails', '~> 5.0'[m
[31m-# Use Uglifier as compressor for JavaScript assets[m
 gem 'uglifier', '>= 1.3.0'[m
[31m-# See https://github.com/rails/execjs#readme for more supported runtimes[m
[31m-# gem 'therubyracer', platforms: :ruby[m
 [m
[31m-# Use CoffeeScript for .coffee assets and views[m
 gem 'coffee-rails', '~> 4.2'[m
[31m-# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks[m
 gem 'turbolinks', '~> 5'[m
[31m-# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder[m
 gem 'jbuilder', '~> 2.5'[m
[31m-# Use Redis adapter to run Action Cable in production[m
[31m-# gem 'redis', '~> 4.0'[m
[31m-# Use ActiveModel has_secure_password[m
[31m-# gem 'bcrypt', '~> 3.1.7'[m
[31m-[m
[31m-# Use Capistrano for deployment[m
[31m-# gem 'capistrano-rails', group: :development[m
 [m
 group :development, :test do[m
[31m-  # Call 'byebug' anywhere in the code to stop execution and get a debugger console[m
   gem 'byebug', platforms: [:mri, :mingw, :x64_mingw][m
[31m-  # Adds support for Capybara system testing and selenium driver[m
   gem 'capybara', '~> 2.13'[m
   gem 'selenium-webdriver'[m
 end[m
 [m
 group :development do[m
[31m-  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.[m
   gem 'web-console', '>= 3.3.0'[m
   gem 'listen', '>= 3.0.5', '< 3.2'[m
[31m-  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring[m
   gem 'spring'[m
   gem 'spring-watcher-listen', '~> 2.0.0'[m
 end[m
 [m
[31m-# Windows does not include zoneinfo files, so bundle the tzinfo-data gem[m
 gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby][m
[32m+[m
 gem 'devise'[m
[32m+[m
[32m+[m[32mgem 'bootstrap-sass'[m
[32m+[m
[32m+[m[32mgem 'autoprefixer-rails'[m[41m [m
[41m+[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex bad632c..a54d650 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -41,8 +41,13 @@[m [mGEM[m
     addressable (2.5.2)[m
       public_suffix (>= 2.0.2, < 4.0)[m
     arel (8.0.0)[m
[32m+[m[32m    autoprefixer-rails (9.1.0)[m
[32m+[m[32m      execjs[m
     bcrypt (3.1.12)[m
     bindex (0.5.0)[m
[32m+[m[32m    bootstrap-sass (3.3.7)[m
[32m+[m[32m      autoprefixer-rails (>= 5.2.1)[m
[32m+[m[32m      sass (>= 3.3.4)[m
     builder (3.2.3)[m
     byebug (10.0.2)[m
     capybara (2.18.0)[m
[36m@@ -188,6 +193,8 @@[m [mPLATFORMS[m
   ruby[m
 [m
 DEPENDENCIES[m
[32m+[m[32m  autoprefixer-rails[m
[32m+[m[32m  bootstrap-sass[m
   byebug[m
   capybara (~> 2.13)[m
   coffee-rails (~> 4.2)[m
[1mdiff --git a/app/assets/javascripts/application.js b/app/assets/javascripts/application.js[m
[1mindex 46b2035..7416e47 100644[m
[1m--- a/app/assets/javascripts/application.js[m
[1m+++ b/app/assets/javascripts/application.js[m
[36m@@ -1,15 +1,3 @@[m
[31m-// This is a manifest file that'll be compiled into application.js, which will include all the files[m
[31m-// listed below.[m
[31m-//[m
[31m-// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's[m
[31m-// vendor/assets/javascripts directory can be referenced here using a relative path.[m
[31m-//[m
[31m-// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the[m
[31m-// compiled file. JavaScript code in this file should be added after the last require_* statement.[m
[31m-//[m
[31m-// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details[m
[31m-// about supported directives.[m
[31m-//[m
 //= require rails-ujs[m
 //= require turbolinks[m
 //= require_tree .[m
[1mdiff --git a/app/assets/javascripts/cable.js b/app/assets/javascripts/cable.js[m
[1mindex 739aa5f..3d8fa7b 100644[m
[1m--- a/app/assets/javascripts/cable.js[m
[1m+++ b/app/assets/javascripts/cable.js[m
[36m@@ -1,6 +1,3 @@[m
[31m-// Action Cable provides the framework to deal with WebSockets in Rails.[m
[31m-// You can generate new channels where WebSocket features live using the `rails generate channel` command.[m
[31m-//[m
 //= require action_cable[m
 //= require_self[m
 //= require_tree ./channels[m
[1mdiff --git a/app/assets/javascripts/pages.coffee b/app/assets/javascripts/pages.coffee[m
[1mdeleted file mode 100644[m
[1mindex 24f83d1..0000000[m
[1m--- a/app/assets/javascripts/pages.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,3 +0,0 @@[m
[31m-# Place all the behaviors and hooks related to the matching controller here.[m
[31m-# All this logic will automatically be available in application.js.[m
[31m-# You can use CoffeeScript in this file: http://coffeescript.org/[m
[1mdiff --git a/app/assets/stylesheets/application.css b/app/assets/stylesheets/application.css[m
[1mdeleted file mode 100644[m
[1mindex d05ea0f..0000000[m
[1m--- a/app/assets/stylesheets/application.css[m
[1m+++ /dev/null[m
[36m@@ -1,15 +0,0 @@[m
[31m-/*[m
[31m- * This is a manifest file that'll be compiled into application.css, which will include all the files[m
[31m- * listed below.[m
[31m- *[m
[31m- * Any CSS and SCSS file within this directory, lib/assets/stylesheets, or any plugin's[m
[31m- * vendor/assets/stylesheets directory can be referenced here using a relative path.[m
[31m- *[m
[31m- * You're free to add application-wide styles to this file and they'll appear at the bottom of the[m
[31m- * compiled file so the styles you add here take precedence over styles defined in any other CSS/SCSS[m
[31m- * files in this directory. Styles in this file should be added after the last require_* statement.[m
[31m- * It is generally better to create a new file per style scope.[m
[31m- *[m
[31m- *= require_tree .[m
[31m- *= require_self[m
[31m- */[m
[1mdiff --git a/app/assets/stylesheets/pages.scss b/app/assets/stylesheets/pages.scss[m
[1mdeleted file mode 100644[m
[1mindex 0d6878a..0000000[m
[1m--- a/app/assets/stylesheets/pages.scss[m
[1m+++ /dev/null[m
[36m@@ -1,3 +0,0 @@[m
[31m-// Place all the styles related to the pages controller here.[m
[31m-// They will automatically be included in application.css.[m
[31m-// You can use Sass (SCSS) here: http://sass-lang.com/[m
[1mdiff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb[m
[1mindex fa45399..657d1b6 100644[m
[1m--- a/app/controllers/application_controller.rb[m
[1m+++ b/app/controllers/application_controller.rb[m
[36m@@ -1,16 +1,16 @@[m
 class ApplicationController < ActionController::Base[m
[31m-  before_action :authenticate_user![m
   protect_from_forgery with: :exception[m
   [m
[32m+[m[32m  before_action :authenticate_user![m
[32m+[m[41m  [m
   before_action :configure_permitted_parameters, if: :devise_controller?[m
 [m
   protected[m
[31m-[m
[32m+[m[41m  [m
    def configure_permitted_parameters[m
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :date_of_birth, :password, :remmenber_me])[m
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remmenber_me])[m
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :date_of_birth, :password, :remmenber_me])[m
[31m-    [m
    end[m
[31m-  [m
[32m+[m[41m   [m
 end[m
[1mdiff --git a/app/controllers/pages_controller.rb b/app/controllers/pages_controller.rb[m
[1mindex 4167fc6..88486d5 100644[m
[1m--- a/app/controllers/pages_controller.rb[m
[1m+++ b/app/controllers/pages_controller.rb[m
[36m@@ -1,5 +1,6 @@[m
 class PagesController < ApplicationController[m
   skip_before_action :authenticate_user!, only: [:home][m
[32m+[m[41m  [m
   def home[m
   end[m
 end[m
[1mdiff --git a/app/helpers/application_helper.rb b/app/helpers/application_helper.rb[m
[1mindex de6be79..40efeab 100644[m
[1m--- a/app/helpers/application_helper.rb[m
[1m+++ b/app/helpers/application_helper.rb[m
[36m@@ -1,2 +1,8 @@[m
 module ApplicationHelper[m
[32m+[m[32m  def flash_class(level)[m
[32m+[m[32m    case level[m
[32m+[m[32m        when "success" then "alert alert-success"[m
[32m+[m[32m        when "error" then "alert alert-error"[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
 end[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mindex 723cb0b..e46cbdd 100644[m
[1m--- a/app/models/user.rb[m
[1m+++ b/app/models/user.rb[m
[36m@@ -6,18 +6,4 @@[m [mclass User < ApplicationRecord[m
          [m
   enum role: [:user, :admin, :manager][m
   enum status: [:active, :inactive][m
[31m-  after_initialize :set_default_role, :set_default_status,  :if => :new_record?[m
[31m-[m
[31m-  def set_default_role[m
[31m-    self.role ||= :user[m
[31m-  end[m
[31m-[m
[31m-  def set_default_status[m
[31m-    self.status ||= :active[m
[31m-  end[m
[31m-[m
[31m-   before_create do[m
[31m-    self.first_name = first_name.capitalize[m
[31m-    self.last_name = last_name.capitalize[m
[31m-  end[m
 end[m
[1mdiff --git a/app/views/devise/confirmations/new.html.erb b/app/views/devise/confirmations/new.html.erb[m
[1mindex 2dea366..5698b0d 100644[m
[1m--- a/app/views/devise/confirmations/new.html.erb[m
[1m+++ b/app/views/devise/confirmations/new.html.erb[m
[36m@@ -1,16 +1,19 @@[m
[32m+[m[32m<div class="container">[m
 <h2>Resend confirmation instructions</h2>[m
 [m
 <%= form_for(resource, as: resource_name, url: confirmation_path(resource_name), html: { method: :post }) do |f| %>[m
   <%= devise_error_messages! %>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email", value: (resource.pending_reconfirmation? ? resource.unconfirmed_email : resource.email) %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :email %>[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, autocomplete: "email", value: (resource.pending_reconfirmation? ? resource.unconfirmed_email : resource.email),class: "form-control" %>[m
   </div>[m
 [m
   <div class="actions">[m
[31m-    <%= f.submit "Resend confirmation instructions" %>[m
[32m+[m[32m    <%= f.submit "Resend confirmation instructions",class: "btn-primary" %>[m
   </div>[m
 <% end %>[m
 [m
 <%= render "devise/shared/links" %>[m
[32m+[m[32m<br><br>[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/mailer/confirmation_instructions.html.erb b/app/views/devise/mailer/confirmation_instructions.html.erb[m
[1mindex dc55f64..31b6e37 100644[m
[1m--- a/app/views/devise/mailer/confirmation_instructions.html.erb[m
[1m+++ b/app/views/devise/mailer/confirmation_instructions.html.erb[m
[36m@@ -1,5 +1,9 @@[m
[32m+[m[32m<div class="container">[m
[32m+[m[41m  [m
 <p>Welcome <%= @email %>!</p>[m
 [m
 <p>You can confirm your account email through the link below:</p>[m
 [m
 <p><%= link_to 'Confirm my account', confirmation_url(@resource, confirmation_token: @token) %></p>[m
[32m+[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/mailer/email_changed.html.erb b/app/views/devise/mailer/email_changed.html.erb[m
[1mindex 32f4ba8..2b557d9 100644[m
[1m--- a/app/views/devise/mailer/email_changed.html.erb[m
[1m+++ b/app/views/devise/mailer/email_changed.html.erb[m
[36m@@ -1,3 +1,5 @@[m
[32m+[m[32m<div class="container">[m
[32m+[m[41m  [m
 <p>Hello <%= @email %>!</p>[m
 [m
 <% if @resource.try(:unconfirmed_email?) %>[m
[36m@@ -5,3 +7,5 @@[m
 <% else %>[m
   <p>We're contacting you to notify you that your email has been changed to <%= @resource.email %>.</p>[m
 <% end %>[m
[32m+[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/mailer/password_change.html.erb b/app/views/devise/mailer/password_change.html.erb[m
[1mindex b41daf4..716dac5 100644[m
[1m--- a/app/views/devise/mailer/password_change.html.erb[m
[1m+++ b/app/views/devise/mailer/password_change.html.erb[m
[36m@@ -1,3 +1,7 @@[m
[32m+[m[32m<div class="container">[m
[32m+[m[41m  [m
 <p>Hello <%= @resource.email %>!</p>[m
 [m
 <p>We're contacting you to notify you that your password has been changed.</p>[m
[32m+[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/mailer/reset_password_instructions.html.erb b/app/views/devise/mailer/reset_password_instructions.html.erb[m
[1mindex f667dc1..be5c1ae 100644[m
[1m--- a/app/views/devise/mailer/reset_password_instructions.html.erb[m
[1m+++ b/app/views/devise/mailer/reset_password_instructions.html.erb[m
[36m@@ -1,3 +1,5 @@[m
[32m+[m[32m<div class="container">[m
[32m+[m[41m  [m
 <p>Hello <%= @resource.email %>!</p>[m
 [m
 <p>Someone has requested a link to change your password. You can do this through the link below.</p>[m
[36m@@ -5,4 +7,7 @@[m
 <p><%= link_to 'Change my password', edit_password_url(@resource, reset_password_token: @token) %></p>[m
 [m
 <p>If you didn't request this, please ignore this email.</p>[m
[32m+[m
 <p>Your password won't change until you access the link above and create a new one.</p>[m
[32m+[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/mailer/unlock_instructions.html.erb b/app/views/devise/mailer/unlock_instructions.html.erb[m
[1mindex 41e148b..510d58f 100644[m
[1m--- a/app/views/devise/mailer/unlock_instructions.html.erb[m
[1m+++ b/app/views/devise/mailer/unlock_instructions.html.erb[m
[36m@@ -1,3 +1,5 @@[m
[32m+[m[32m<div class="container">[m
[32m+[m[41m  [m
 <p>Hello <%= @resource.email %>!</p>[m
 [m
 <p>Your account has been locked due to an excessive number of unsuccessful sign in attempts.</p>[m
[36m@@ -5,3 +7,5 @@[m
 <p>Click the link below to unlock your account:</p>[m
 [m
 <p><%= link_to 'Unlock my account', unlock_url(@resource, unlock_token: @token) %></p>[m
[32m+[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/passwords/edit.html.erb b/app/views/devise/passwords/edit.html.erb[m
[1mindex 6a796b0..790b299 100644[m
[1m--- a/app/views/devise/passwords/edit.html.erb[m
[1m+++ b/app/views/devise/passwords/edit.html.erb[m
[36m@@ -1,25 +1,28 @@[m
[32m+[m[32m<div class="container">[m
 <h2>Change your password</h2>[m
 [m
 <%= form_for(resource, as: resource_name, url: password_path(resource_name), html: { method: :put }) do |f| %>[m
   <%= devise_error_messages! %>[m
   <%= f.hidden_field :reset_password_token %>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password, "New password" %><br />[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :password, "New password" %>[m
     <% if @minimum_password_length %>[m
[31m-      <em>(<%= @minimum_password_length %> characters minimum)</em><br />[m
[32m+[m[32m      <em>(<%= @minimum_password_length %> characters minimum)</em>[m
     <% end %>[m
[31m-    <%= f.password_field :password, autofocus: true, autocomplete: "off" %>[m
[32m+[m[32m    <%= f.password_field :password, autofocus: true, autocomplete: "off" ,, class: "form-control"%>[m
   </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password_confirmation, "Confirm new password" %><br />[m
[31m-    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :password_confirmation, "Confirm new password" %>[m
[32m+[m[32m    <%= f.password_field :password_confirmation, autocomplete: "off",, class: "form-control" %>[m
   </div>[m
 [m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "Change my password" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.submit "Change my password" ,class: "btn-primary"%>[m
   </div>[m
 <% end %>[m
 [m
 <%= render "devise/shared/links" %>[m
[32m+[m[32m<br><br>[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/passwords/new.html.erb b/app/views/devise/passwords/new.html.erb[m
[1mindex 11b3d6a..4c3708b 100644[m
[1m--- a/app/views/devise/passwords/new.html.erb[m
[1m+++ b/app/views/devise/passwords/new.html.erb[m
[36m@@ -1,16 +1,19 @@[m
[32m+[m[32m<div class="container">[m
 <h2>Forgot your password?</h2>[m
 [m
 <%= form_for(resource, as: resource_name, url: password_path(resource_name), html: { method: :post }) do |f| %>[m
   <%= devise_error_messages! %>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :email %>[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, autocomplete: "email",class: "form-control" %>[m
   </div>[m
 [m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "Send me reset password instructions" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.submit "Send me reset password instructions",class: "btn-primary" %>[m
   </div>[m
 <% end %>[m
 [m
 <%= render "devise/shared/links" %>[m
[32m+[m[32m<br><br>[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/registrations/edit.html.erb b/app/views/devise/registrations/edit.html.erb[m
[1mindex 2af9f48..990fb7c 100644[m
[1m--- a/app/views/devise/registrations/edit.html.erb[m
[1m+++ b/app/views/devise/registrations/edit.html.erb[m
[36m@@ -1,58 +1,59 @@[m
[32m+[m[32m<div class="container">[m
 <h2>Edit <%= resource_name.to_s.humanize %></h2>[m
 [m
 <%= form_for(resource, as: resource_name, url: registration_path(resource_name), html: { method: :put }) do |f| %>[m
   <%= devise_error_messages! %>[m
[31m-[m
[31m-  <div class="field">[m
[31m-    <%= f.label :first_name %><br />[m
[31m-    <%= f.text_field :first_name, autofocus: true%>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :first_name %>[m
[32m+[m[32m    <%= f.text_field :first_name, autofocus: true, class: "form-control"%>[m
   </div>[m
   [m
[31m-  <div class="field">[m
[31m-    <%= f.label :last_name %><br />[m
[31m-    <%= f.text_field :last_name, autofocus: true %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :last_name %>[m
[32m+[m[32m    <%= f.text_field :last_name, autofocus: true, class: "form-control" %>[m
   </div>[m
   [m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :email %>[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, autocomplete: "email", class: "form-control" %>[m
   </div>[m
   [m
[31m-  <div class="field">[m
[31m-    <%= f.label :DOB %><br />[m
[31m-    <%= f.date_field :date_of_birth %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :DOB %>[m
[32m+[m[32m    <%= f.date_field :date_of_birth, class: "form-control" %>[m
   </div>[m
 [m
   <% if devise_mapping.confirmable? && resource.pending_reconfirmation? %>[m
     <div>Currently waiting confirmation for: <%= resource.unconfirmed_email %></div>[m
   <% end %>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password %> <i>(leave blank if you don't want to change it)</i><br />[m
[31m-    <%= f.password_field :password, autocomplete: "off" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :password %> <i>(leave blank if you don't want to change it)</i>[m
[32m+[m[32m    <%= f.password_field :password, autocomplete: "off", class: "form-control" %>[m
     <% if @minimum_password_length %>[m
       <br />[m
       <em><%= @minimum_password_length %> characters minimum</em>[m
     <% end %>[m
   </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password_confirmation %><br />[m
[31m-    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :password_confirmation %>[m
[32m+[m[32m    <%= f.password_field :password_confirmation, autocomplete: "off", class: "form-control" %>[m
   </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :current_password %> <i>(we need your current password to confirm your changes)</i><br />[m
[31m-    <%= f.password_field :current_password, autocomplete: "off" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :current_password %> <i>(we need your current password to confirm your changes)</i>[m
[32m+[m[32m    <%= f.password_field :current_password, autocomplete: "off", class: "form-control" %>[m
   </div>[m
 [m
   <div class="actions">[m
[31m-    <%= f.submit "Update" %>[m
[32m+[m[32m    <%= f.submit "Update", class: "btn btn-primary" %>[m
   </div>[m
 <% end %>[m
 [m
 <h3>Cancel my account</h3>[m
 [m
[31m-<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete %></p>[m
[32m+[m[32m<p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), data: { confirm: "Are you sure?" }, method: :delete , class: "btn btn-danger" %></p>[m
 [m
 <%= link_to "Back", :back %>[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/registrations/new.html.erb b/app/views/devise/registrations/new.html.erb[m
[1mindex 92722ee..58a261c 100644[m
[1m--- a/app/views/devise/registrations/new.html.erb[m
[1m+++ b/app/views/devise/registrations/new.html.erb[m
[36m@@ -1,44 +1,45 @@[m
[31m-<h2>Sign up</h2>[m
[32m+[m[32m<div class="container">[m
[32m+[m[32m  <h2>Sign up</h2>[m
 [m
[31m-<%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
[32m+[m[32m  <%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
   <%= devise_error_messages! %>[m
[31m-[m
[31m-  <div class="field">[m
[31m-    <%= f.label :first_name %><br />[m
[31m-    <%= f.text_field :first_name, autofocus: true%>[m
[31m-  </div>[m
[32m+[m[32m   <div class="form-group">[m
[32m+[m[32m    <%= f.label :first_name %>[m
[32m+[m[32m    <%= f.text_field :first_name, autofocus: true, class: "form-control"%>[m
[32m+[m[32m   </div>[m
   [m
[31m-  <div class="field">[m
[31m-    <%= f.label :last_name %><br />[m
[31m-    <%= f.text_field :last_name, autofocus: true %>[m
[31m-  </div>[m
[32m+[m[32m   <div class="form-group">[m
[32m+[m[32m    <%= f.label :last_name %>[m
[32m+[m[32m    <%= f.text_field :last_name, autofocus: true , class: "form-control"%>[m
[32m+[m[32m   </div>[m
   [m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>[m
[31m-  </div>[m
[32m+[m[32m   <div class="form-group">[m
[32m+[m[32m    <%= f.label :email %>[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, autocomplete: "email", class: "form-control" %>[m
[32m+[m[32m   </div>[m
   [m
[31m-  <div class="field">[m
[31m-    <%= f.label :DOB %><br />[m
[31m-    <%= f.date_field :date_of_birth %>[m
[31m-  </div>[m
[32m+[m[32m   <div class="form-group">[m
[32m+[m[32m    <%= f.label :DOB %>[m
[32m+[m[32m    <%= f.date_field :date_of_birth, class: "form-control" %>[m
[32m+[m[32m   </div>[m
 [m
[31m-  <div class="field">[m
[32m+[m[32m   <div class="form-group">[m
     <%= f.label :password %>[m
     <% if @minimum_password_length %>[m
     <em>(<%= @minimum_password_length %> characters minimum)</em>[m
     <% end %><br />[m
[31m-    <%= f.password_field :password, autocomplete: "off" %>[m
[31m-  </div>[m
[32m+[m[32m    <%= f.password_field :password, autocomplete: "off", class: "form-control" %>[m
[32m+[m[32m   </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password_confirmation %><br />[m
[31m-    <%= f.password_field :password_confirmation, autocomplete: "off" %>[m
[31m-  </div>[m
[32m+[m[32m   <div class="form-group">[m
[32m+[m[32m    <%= f.label :password_confirmation %>[m
[32m+[m[32m    <%= f.password_field :password_confirmation, autocomplete: "off", class: "form-control" %>[m
[32m+[m[32m   </div>[m
 [m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "Sign up" %>[m
[31m-  </div>[m
[31m-<% end %>[m
[32m+[m[32m   <div class="form-group">[m
[32m+[m[32m    <%= f.submit "Sign up", class: "btn btn-primary" %>[m
[32m+[m[32m   </div>[m
[32m+[m[32m  <% end %>[m
 [m
 <%= render "devise/shared/links" %>[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/sessions/new.html.erb b/app/views/devise/sessions/new.html.erb[m
[1mindex 3ebb001..4419334 100644[m
[1m--- a/app/views/devise/sessions/new.html.erb[m
[1m+++ b/app/views/devise/sessions/new.html.erb[m
[36m@@ -1,26 +1,28 @@[m
[31m-<h2>Log in</h2>[m
[32m+[m[32m<div class="container">[m[41m [m
[32m+[m[32m  <h2>Log in</h2>[m
 [m
[31m-<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>[m
[32m+[m[32m  <%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f|%>[m
[32m+[m[32m   <%= devise_error_messages! %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :email %>[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, autocomplete: "email",class: "form-control", placeholder: "Enter email" %>[m
   </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password %><br />[m
[31m-    <%= f.password_field :password, autocomplete: "off" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :password %>[m
[32m+[m[32m    <%= f.password_field :password, autocomplete: "off",class: "form-control", placeholder: "Enter password" %>[m
   </div>[m
 [m
   <% if devise_mapping.rememberable? -%>[m
     <div class="field">[m
[31m-      <%= f.check_box :remember_me %>[m
[32m+[m[32m      <%= f.check_box :remember_me%>[m
       <%= f.label :remember_me %>[m
     </div>[m
[31m-  <% end -%>[m
[32m+[m[32m  <% end %>[m
 [m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "Log in" %>[m
[32m+[m[32m  <div class="form-group" >[m
[32m+[m[32m    <%= f.submit "Log in", class: "btn-primary"%>[m
   </div>[m
 <% end %>[m
[31m-[m
[31m-<%= render "devise/shared/links" %>[m
[32m+[m[32m <%= render "devise/shared/links" %>[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/devise/shared/_links.html.erb b/app/views/devise/shared/_links.html.erb[m
[1mindex e6a3e41..f695469 100644[m
[1m--- a/app/views/devise/shared/_links.html.erb[m
[1m+++ b/app/views/devise/shared/_links.html.erb[m
[36m@@ -1,25 +1,25 @@[m
 <%- if controller_name != 'sessions' %>[m
[31m-  <%= link_to "Log in", new_session_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Log in", new_session_path(resource_name), class: "clearfix" %>[m
 <% end -%>[m
 [m
 <%- if devise_mapping.registerable? && controller_name != 'registrations' %>[m
[31m-  <%= link_to "Sign up", new_registration_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Sign up", new_registration_path(resource_name), class: "clearfix" %>[m
 <% end -%>[m
 [m
 <%- if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations' %>[m
[31m-  <%= link_to "Forgot your password?", new_password_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Forgot your password?", new_password_path(resource_name), class: "clearfix" %>[m
 <% end -%>[m
 [m
 <%- if devise_mapping.confirmable? && controller_name != 'confirmations' %>[m
[31m-  <%= link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name), class: "clearfix" %>[m
 <% end -%>[m
 [m
 <%- if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks' %>[m
[31m-  <%= link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name), class: "clearfix" %>[m
 <% end -%>[m
 [m
 <%- if devise_mapping.omniauthable? %>[m
   <%- resource_class.omniauth_providers.each do |provider| %>[m
[31m-    <%= link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider) %><br />[m
[32m+[m[32m    <%= link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider), class: "clearfix" %><br />[m
   <% end -%>[m
 <% end -%>[m
[1mdiff --git a/app/views/devise/unlocks/new.html.erb b/app/views/devise/unlocks/new.html.erb[m
[1mindex cfe8aa8..558443f 100644[m
[1m--- a/app/views/devise/unlocks/new.html.erb[m
[1m+++ b/app/views/devise/unlocks/new.html.erb[m
[36m@@ -1,16 +1,19 @@[m
[32m+[m[32m<div class="container">[m
 <h2>Resend unlock instructions</h2>[m
 [m
 <%= form_for(resource, as: resource_name, url: unlock_path(resource_name), html: { method: :post }) do |f| %>[m
   <%= devise_error_messages! %>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>[m
[32m+[m[32m  <div class="form-group">[m
[32m+[m[32m    <%= f.label :email %>[m
[32m+[m[32m    <%= f.email_field :email, autofocus: true, autocomplete: "email",class: "form-control" %>[m
   </div>[m
 [m
   <div class="actions">[m
[31m-    <%= f.submit "Resend unlock instructions" %>[m
[32m+[m[32m    <%= f.submit "Resend unlock instructions" ,class: "btn-primary" %>[m
   </div>[m
 <% end %>[m
 [m
 <%= render "devise/shared/links" %>[m
[32m+[m[32m<br><br>[m
[32m+[m[32m</div>[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex 104f66c..0fd6490 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -9,9 +9,8 @@[m
   </head>[m
 [m
   <body>[m
[31m-    <p class="notice"><%= notice %></p>[m
[31m-    <p class="alert"><%= alert %></p>[m
[31m-[m
[32m+[m[32m    <%= render partial: 'layouts/header' %>[m
[32m+[m[32m    <%= render partial: 'layouts/messegesform' %>[m
     <%= yield %>[m
   </body>[m
 </html>[m
[1mdiff --git a/app/views/layouts/mailer.html.erb b/app/views/layouts/mailer.html.erb[m
[1mdeleted file mode 100644[m
[1mindex cbd34d2..0000000[m
[1m--- a/app/views/layouts/mailer.html.erb[m
[1m+++ /dev/null[m
[36m@@ -1,13 +0,0 @@[m
[31m-<!DOCTYPE html>[m
[31m-<html>[m
[31m-  <head>[m
[31m-    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />[m
[31m-    <style>[m
[31m-      /* Email styles need to be inline */[m
[31m-    </style>[m
[31m-  </head>[m
[31m-[m
[31m-  <body>[m
[31m-    <%= yield %>[m
[31m-  </body>[m
[31m-</html>[m
[1mdiff --git a/app/views/layouts/mailer.text.erb b/app/views/layouts/mailer.text.erb[m
[1mdeleted file mode 100644[m
[1mindex 37f0bdd..0000000[m
[1m--- a/app/views/layouts/mailer.text.erb[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-<%= yield %>[m
[1mdiff --git a/db/migrate/20180809064535_add_details_to_user.rb b/db/migrate/20180809064535_add_details_to_user.rb[m
[1mindex eb63edd..3d1dafc 100644[m
[1m--- a/db/migrate/20180809064535_add_details_to_user.rb[m
[1m+++ b/db/migrate/20180809064535_add_details_to_user.rb[m
[36m@@ -1,9 +1,9 @@[m
 class AddDetailsToUser < ActiveRecord::Migration[5.1][m
   def change[m
[31m-    add_column :users, :first_name, :string[m
[32m+[m[32m    add_column :users, :first_name, :string[m[41m [m
     add_column :users, :last_name, :string[m
     add_column :users, :date_of_birth, :date[m
[31m-    add_column :users, :role, :integer[m
[31m-    add_column :users, :status, :integer[m
[32m+[m[32m    add_column :users, :role, :integer, default: 0[m
[32m+[m[32m    add_column :users, :status, :integer, default: 0[m
   end[m
 end[m
[1mdiff --git a/db/schema.rb b/db/schema.rb[m
[1mindex e523b06..1e977c6 100644[m
[1m--- a/db/schema.rb[m
[1m+++ b/db/schema.rb[m
[36m@@ -28,8 +28,8 @@[m [mActiveRecord::Schema.define(version: 20180809064535) do[m
     t.string "first_name"[m
     t.string "last_name"[m
     t.date "date_of_birth"[m
[31m-    t.integer "role"[m
[31m-    t.integer "status"[m
[32m+[m[32m    t.integer "role", default: 0[m
[32m+[m[32m    t.integer "status", default: 0[m
     t.index ["email"], name: "index_users_on_email", unique: true[m
     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true[m
   end[m
