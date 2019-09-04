class LikesChannel < ApplicationCable::Channel

  def subscribed
    stream_from "likes"
  end

end
