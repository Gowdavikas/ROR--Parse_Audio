require 'rails_helper'

RSpec.describe Transcript, type: :model do
    describe 'validations' do
      it 'validates the presence of transcript_text' do
        transcript = Transcript.new(transcript_text: nil)
        expect(transcript).not_to be_valid
        expect(transcript.errors[:transcript_text]).to include("can't be blank")
      end
  
      it 'validates the length of transcript_text' do
        transcript = Transcript.new(transcript_text: 'a' * 1001)
        expect(transcript).not_to be_valid
        expect(transcript.errors[:transcript_text]).to include("is too long (maximum is 1000 characters)")
      end
    end

    describe "validations" do
        it "is valid with valid attributes" do
          transcript = Transcript.new(transcript_text: "Sample transcript")
          expect(transcript).to be_valid
        end
    
        it "is not valid without a transcript_text" do
          transcript = Transcript.new(transcript_text: nil)
          expect(transcript).not_to be_valid
        end
      end
end

