class TopController < ApplicationController
  def index
    @situations = Situation.all.sort_created_at.first(3)
  end
end
