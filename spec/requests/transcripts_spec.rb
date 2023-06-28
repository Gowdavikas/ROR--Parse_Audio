require 'rails_helper'

RSpec.describe "Transcripts", type: :request do

  describe "GET /transcript/:id" do
    it "shows a transcript successfully" do
      transcript = Transcript.create(transcript_text: "Sample transcript text")
      get "/transcript/#{transcript.id}"
      expect(response).to have_http_status(200)
    end

    it "returns 'not_found' when transcript is not found" do
      get "/transcript/invalid_id"
      expect(response).to have_http_status(404)

    end
  end

  describe "POST /transcripts" do
    it "creates a transcript successfully" do
      audio_file_path = Rails.root.join('C:/Users/SPURGE/RubyOnRails/Sample Projects/Parse_aud/music/Attention_-_Charlie_Puth (1).mp3')
    
      headers = {
        'Authorization' => 'c139be11d41a4939877efd9045d47a7e'
      }
      
      post "/transcripts", headers: headers, params: { audio_file: Rack::Test::UploadedFile.new(audio_file_path, 'audio/mpeg') }
    
      expect(response).to have_http_status(200)
    end

    it "blocks user when audio contains flagged words" do
      flagged_audio_file_path = 'C:/Users/SPURGE/RubyOnRails/Sample Projects/Parse_aud/music/Attention_-_Charlie_Puth (1).mp3'
  
      headers = {
        'Authorization' => 'c139be11d41a4939877efd9045d47a7e'
      }
      post "/transcripts", headers: headers, params: { audio_file: Rack::Test::UploadedFile.new(flagged_audio_file_path, 'audio/mpeg') }
      expect(response).to have_http_status(200)
    end
  end
end