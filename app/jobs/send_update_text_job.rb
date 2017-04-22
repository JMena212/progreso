class SendUpdateTextJob < ApplicationJob
  queue_as :default

  def perform(project)
   client = Twilio::REST::Client.new
   update_link = project_url(project, host: 'https://progreso-j-mena.c9users.io')
   client.messages.create(
     from: ENV['TWILIO_NUMBER'],
     to: ENV['ADMIN_NUMBER'],
     body: "Progreso! update on #{project.title}! #{update_link}"
   )
  end
end
