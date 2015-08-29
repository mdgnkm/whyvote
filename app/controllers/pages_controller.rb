class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  def show
    render template: "pages/#{params[:page]}"
  end

  def home_logged_in
    render 'pages/home-page-logged-in.html'
  end

  def survey_page
    render 'pages/survey-page.html'
  end

  def survey_results
    render 'pages/survey-results.html'
  end

  def view_users
    render 'pages/view-users.html'
  end

  def friend_dashboard
    render "pages/friend-dashboard.html"
  end

  def stranger_dashboard
    render "pages/stranger-dashboard.html"
  end

  def about_team
    render 'pages/about_team.html.erb'
  end

  def about_whyvote
    render 'pages/about_whyvote.html.erb'
  end

  def about_method
    render 'pages/about_survey-method.html.erb'
  end

end
