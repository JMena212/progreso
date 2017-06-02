class SendUpdateTextJob < ApplicationJob
  queue_as :default

  def perform(project, update, number)
   client = Twilio::REST::Client.new
   update_link = project_update_url(project, update, host: 'https://progreso-j-mena.c9users.io')
   client.messages.create(
     from: ENV['TWILIO_NUMBER'],
     to: number,
     body: "Progreso! update on #{project.title}! #{update_link}"
   )
  end
end
