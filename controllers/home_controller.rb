class HomeController < ApplicationController
  def index
  end

  def about
    @guests_count = Guest.all.count("id")
    @costs_sum_all = Cost.all.sum("amount")
  end

  def calc
  end
end
