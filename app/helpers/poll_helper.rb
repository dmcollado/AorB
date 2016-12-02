module PollHelper

  def share_text
    path = request.original_url
    description = @poll.description ? @poll.description : "This or That"
    URI.encode("#{description} - Vote now! #{path}")
  end

end
