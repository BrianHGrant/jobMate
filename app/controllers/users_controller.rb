class UsersController < ApplicationController
  def show
    @user = current_user
    @jobs = @user.jobs.order(priority: :desc, closing_date: :asc)
    @contacts = @user.contacts.all
    @companies = @user.companies.order(name: :asc, created_at: :desc)
    @quotes = Quote.limit(5).order('RANDOM()')
  end
end
